#include "types.h"
#include "user.h"
#include "mmu.h"
#include "stat.h"


int main(void){
  int *p;
 	p = (int *) sbrk(0);
  sbrk(PGSIZE);
  *p = 1337;
 	mprotect(p, 1);
  int ch  = fork();
  if (ch == 0){
    printf(1,"p = %d\n",*p);
    printf(1, "PROTECTED: value is %d, expecting 1337!\n", *p);
    munprotect(p, 1);
    *p =5;
    printf(1,"p = %d\n",*p);
    printf(1, "UNPROTECTED: value is %d, expecting 5!\n", *p);
    exit();
  } else if (ch > 0) {
    wait();
    printf(1,"BOOM! Should get a Memory Fault\n");
    *p = 5;
 	  exit();
  }


}