// main.c
#include <stdio.h>
#include "queue.h"

int main() {
    printf("main: calling enqueue()\n");
    enqueue();

    printf("main: calling dequeue()\n");
    dequeue();

    return 0;
}
