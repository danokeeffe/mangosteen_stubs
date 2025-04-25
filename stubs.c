// stubs.c
// This file could be auto-generated from e.g. queue.h
#include <stdio.h>
#include "mangosteen.h"

//void client_cmd(int);  // from the shared library

void enqueue() {
     printf("stub (static): calling client_cmd from within enqueue()\n");
     clientCmd(0);
}

void dequeue() {
     printf("stub (static): calling client_cmd from within dequeue()\n");
     clientCmd(1);
}

