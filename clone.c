#include "types.h"
#include "stat.h"
#include "user.h"
#include "mmu.h"

void print_hello();
int main(int argc, char * argv []){

    printf(1, "Chcekpoint 1\n");
    char *stack = sbrk(PGSIZE);
    
    printf(1, "Chcekpoint 2\n");
    clone(&(print_hello), (void *) argv[1], stack);
    join();
    printf(1, "checkpint 3\n");
    exit();

}

void print_hello(char * name){
    printf(1, "Hello From clone. Mr. %s\n", name);
    exit();
}