#include "types.h"
#include "stat.h"
#include "user.h"
#define NULL ((void *)0)
int main (int argc , char *argv[]){
    int *pi;
    pi = NULL;
    printf(1, "Null pointer value: %p\n",*pi);
    exit();
}