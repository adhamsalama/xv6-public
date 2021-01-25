#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include <stddef.h>

void question(){
    printf(1, "Why Are We Here ??\n");
    exit();
}

void decToBinary(int n) 
{ 
    // array to store binary number 
    int binaryNum[32]; 

    // counter for binary array 
    int i = 0; 
    while (n > 0) { 

        // storing remainder in binary array 
        binaryNum[i] = n % 2; 
        n = n / 2; 
        i++; 
    }

    // printing binary array in reverse order 
    for (int j = i - 1; j >= 0; j--){
      printf(1, "%d",binaryNum[j]);
    }
    printf(1, "\n");

}

void mathematician(void* X, void* Y){
  int b = 69;
	printf(1, "The binary for %d is:\n",b);
	decToBinary(b);
  thread_create(&question, NULL, NULL);
  thread_join();
  printf(1, "X: %d, Y: %d\n",*(int*) X,*(int*) Y);

  exit();
}

int
main(int argc, char *argv[])
{
  int x = 5, y = 10;
  printf(1, "Welcome In Summoner's Rift\n");
  thread_create(&mathematician, (void *)&x, (void *)&y);
  thread_join();
  printf(1, "please give us the bouns OR ELSE we will kill Ahmed Hesham\n");
  exit();
}