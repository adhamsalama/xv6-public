#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "x86.h"
#include "proc.h"
#include "spinlock.h"
#include "rand.h"
#include "pstat.h"

struct {
  struct spinlock lock;
  struct proc proc[NPROC];
} ptable;

static struct proc *initproc;

int nextpid = 1;
extern void forkret(void);
extern void trapret(void);

static void wakeup1(void *chan);

void
pinit(void)
{
  initlock(&ptable.lock, "ptable");
}

// Must be called with interrupts disabled
int
cpuid() {
  return mycpu()-cpus;
}

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu*
mycpu(void)
{
  int apicid, i;
  
  if(readeflags()&FL_IF)
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return &cpus[i];
  }
  panic("unknown apicid\n");
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  // disable interrupts 
  pushcli();
  c = mycpu();
  p = c->proc;
  // enable interrupts 
  popcli();
  return p;
}

//PAGEBREAK: 32
// Look in the process table for an UNUSED proc.
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{ 
  // p->readid = 0;
  struct proc *p;
  char *sp;
  
  

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
  p->readid = 0 ;
  p->tickets = 1;
  p->ticks = 0;
  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
  p->tf->es = p->tf->ds;
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
  p->cwd = namei("/");

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);

  p->state = RUNNABLE;

  release(&ptable.lock);
}

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
  switchuvm(curproc);
  return 0;
}

// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
  int i, pid;
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
    // new process (child) will get the same tickets 
  // number as the parent 
  np->tickets = curproc->tickets;
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));

  pid = np->pid;

  acquire(&ptable.lock);

  np->state = RUNNABLE;

  release(&ptable.lock);

  return pid;
}

// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if(curproc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd]){
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }

  begin_op();
  iput(curproc->cwd);
  end_op();
  curproc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
      if(p->state == ZOMBIE)
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  curproc->state = ZOMBIE;
  sched();
  panic("zombie exit");
}

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->parent != curproc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
        freevm(p->pgdir);
        p->pid = 0;
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
// get the total number of tickets (for runnable processes)
int
lottery_total(void){
  struct proc *p;
  int total_tickets = 0;

//loop over process table and increment total_tickets
//if a runnable process is found 
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if(p->state==RUNNABLE){
      total_tickets+=p->tickets;
    }
  }

//returning total number of tickets (for runnable processes)
  return total_tickets;
}
//PAGEBREAK: 42
// Per-CPU process scheduler.
// Each CPU calls scheduler() after setting itself up.
// Scheduler never returns.  It loops, doing:
//  - choose a process to run
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
  struct proc *p;
  struct cpu *c = mycpu();
  c->proc = 0;
  long total_tickets = 0;
  long counter = 0;
  long winner = 0;

  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    // lock process table
    acquire(&ptable.lock);
    total_tickets = lottery_total();
    winner = random_at_most(total_tickets);
    counter = 0;

    // loop over the process table
    // NPROC = number of processes in the process table 
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){

      // if the process is zombie ( not runnable)
      // increament the *p and continue the loop
      if(p->state != RUNNABLE) {
            continue;
      }
      // otherwise (process is runnable) 
      counter += p->tickets;
      // continue (get the next process) if we didn't react the winner 
      if (counter < winner) {
            continue;
      }

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
      p->state = RUNNING;

      swtch(&(c->scheduler), p->context);
      switchkvm();
      p->ticks += 1;

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
      // break after getting the winner
      break;
    }
    // unlock process table
    release(&ptable.lock);
    /*Locking and unlocking process table so that no other 
    process can run while the current process is running*/
  }
}

int 
settickets(int tickets){
  // return -1 if the caller passes in a number less than one
  if(tickets < 1)
    return -1;

  struct proc *p = myproc();
  p -> tickets = tickets;
  // lock the process table
  acquire(&ptable.lock);
  // store the process tickets in its corresponding place in the ptable
  ptable.proc[p-ptable.proc].tickets = tickets;
  // unlock the process table
  release(&ptable.lock);
  // return 0 when success
  return 0;
}

int
getpinfo(struct pstat* ps) {
  int i = 0;
  struct proc *p;
  // lock the process table
  acquire(&ptable.lock);
  // loop over all the process in the process table
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++, i++) {
    ps->pid[i] = p->pid;
    ps->inuse[i] = p->state != UNUSED;
    ps->tickets[i] = p->tickets;
    ps->ticks[i] = p->ticks;
  }
  // unlock the process table
  release(&ptable.lock);
  return 0;
}

// Enter scheduler.  Must hold only ptable.lock
// and have changed proc->state. Saves and restores
// intena because intena is a property of this
// kernel thread, not this CPU. It should
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
  swtch(&p->context, mycpu()->scheduler);
  mycpu()->intena = intena;
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
  acquire(&ptable.lock);  //DOC: yieldlock
  myproc()->state = RUNNABLE;
  sched();
  release(&ptable.lock);
}

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");

  // Must acquire ptable.lock in order to
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }
  // Go to sleep.
  p->chan = chan;
  p->state = SLEEPING;

  sched();

  // Tidy up.
  p->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}

//PAGEBREAK!
// Wake up all processes sleeping on chan.
// The ptable lock must be held.
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == SLEEPING && p->chan == chan)
      p->state = RUNNABLE;
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
}

// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}

//PAGEBREAK: 36
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
  static char *states[] = {
  [UNUSED]    "unused",
  [EMBRYO]    "embryo",
  [SLEEPING]  "sleep ",
  [RUNNABLE]  "runble",
  [RUNNING]   "run   ",
  [ZOMBIE]    "zombie"
  };
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
      state = states[p->state];
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}

int 
clone(void(*fcn)(void*,void*), void *arg1,void *arg2, void *stack) {

   struct proc *np;
   struct proc *curproc = myproc();

    // check if we have less than one memory page
    /*
      // The clone() system call creates a new thread-like process. 
      // the child process shares the address space of the original process 
      // (fork() creates a whole new copy of the address space, 
      // keeping the child completely separate from the parent)
      // void (*fcn)(void*) is a pointer to the function that 
      // void *arg is the argument that will be passed to *fcn once the child runs
      // void *stack is a memory address in the parent's address space 
      // Remember a void* is used to point to a data type that is not yet specified.
    */    
    if ((curproc->sz - (uint) stack) < PGSIZE) {
     return -1;
    }
   // Allocate process.
   if ((np = allocproc()) == 0) {
     return -1;
   }
   // copy the shared address spaces of the parent process
   np->pgdir = curproc->pgdir;
   np->sz = curproc->sz;
   np->parent = curproc;
   *np->tf = *curproc->tf;
   uint user_stack[3];
    user_stack[0] = 0xffffffff;
    user_stack[1] = (uint) arg1;
    user_stack[2] = (uint) arg2;
    // set top of the stack to the allocated page
    // (stack is actually the bottom of the page)
    uint stack_top = (uint) stack + PGSIZE; 
    // subtract 12 bytes from the stack top to
    // make space for the two values being saved
    stack_top -= 12;
    // copy user stack values to np's memory
    if (copyout(np->pgdir, stack_top, user_stack, 12) < 0) {
        return -1;
    }
    // set stack base and stack pointers for return-from-trap
    // they will be the same value because we are returning into a function
    np->tf->ebp = (uint) stack_top;
    np->tf->esp = (uint) stack_top;
    // set instruction pointer to address of function
    np->tf->eip = (uint) fcn;
   // Clear %eax so that fork returns 0 in the child.
   np->tf->eax = 0;
   int i ;
   for (i = 0; i < NOFILE; i++)
     if (curproc->ofile[i]) np->ofile[i] = filedup(curproc->ofile[i]);

   // Duplicate the current directory to be used by the new thread
   np->cwd = idup(curproc->cwd);

   // Make the state of the new thread to be runnable 
   np->state = RUNNABLE;

   // Make the two threads belong to the current process
   safestrcpy(np->name, curproc->name, sizeof(curproc->name));
   return np->pid;
 }

int join(void** stack) {
   struct proc *p;
   int haveThreads, pid;
   struct proc *curproc = myproc();
   acquire(&ptable.lock);
   for(;;){
     // Scan through table looking for exited children.
     haveThreads = 0;
     for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
       if(p->parent != curproc)
         continue;
       if(p->parent->pgdir != curproc->pgdir) // if they share the same address space
         continue;
        // Found one.
       haveThreads = 1;
       if(p->state == ZOMBIE){
         pid = p->pid;
         kfree(p->kstack);
         p->kstack = 0;
         p->pid = 0;
         p->parent = 0;
         p->name[0] = 0;
         p->killed = 0;
         p->state = UNUSED;
         stack = p->threadstack;
         p->threadstack = 0;
         release(&ptable.lock);
         return pid;
       }// End if
     } // inner loop
     // No point waiting if we don't have any children.
     if(!haveThreads || curproc->killed){
       release(&ptable.lock);
       return -1;
     } // end if
     // Wait for children to exit.  (See wakeup1 call in proc_exit.)
     sleep(curproc, &ptable.lock);  //DOC wait-sleep
   }// End outer loop
 } // End join
