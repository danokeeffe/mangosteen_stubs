Toy example of how to build a Mangosteen data structure.

- `main.c`: The original application's client code. 
- `queue.h` and `queue.c`: The original interface and implementation for the queue data structure.
- `mangosteen.h` and `mangosteen.c`: The interface and implementation of the core Mangosteen library.
- `callbacks.c`: The client's implementations of the Mangosteen callbacks for this data structure (just process_request in this case). Calls functions from the original queue implementation.
- `stubs.c`: Potentially auto-generated stubs for the queue interface functions that instead call into the Mangosteen shared library via clientCmd. 
- `Makefile`: `make all` to build and `make run` to run. Note the use of `-Wl,-Bsymbolic` when building the Mangosteen queue shared library. This ensures the linker binds symbol references inside the shared library to the symbols defined within the library itself.
