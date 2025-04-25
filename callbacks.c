#include <stdio.h>
#include "mangosteen.h"
#include "queue.h"

void processRequest(int op) {
    if (op) {
        dequeue();
    } else {
        enqueue();
    }
}

