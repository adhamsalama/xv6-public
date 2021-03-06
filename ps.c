#include "types.h"
#include "user.h"
#include "pstat.h"

int main(int argc, char* argv[]){
   int i = 0;
   struct pstat ps;
  while(i < 5){
    getpinfo(&ps);
    printf(1, "\nPID\t|\tUSED?\t|\tTickets\t|\tticks\n");
    printf(1, "========|===============|===============|====================\n");
    for (int i = 0; i < sizeof(ps.pid)/sizeof(ps.pid[0]); i++)
    {
      if(ps.pid[i]){
        printf(1, "%d\t|\t%d\t|\t%d\t|\t%d\n", ps.pid[i], ps.inuse[i], ps.tickets[i], ps.ticks[i]);
        printf(1, "========|===============|===============|====================\n");
      }
    }
    printf(1, "\n***********************************************************************\n");
    sleep(100);
      i++;
  }
  exit();
  return 0;
}
