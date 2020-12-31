#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[])
{  
  printf(1, "call counter: %d\n", getreadcount());
  exit();
  return 0;
}