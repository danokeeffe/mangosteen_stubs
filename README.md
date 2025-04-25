Toy example of how to build a Mangosteen data structure without modifying the original data structure or client code.

- `main.c`: The original application's client code. 
- `queue.h` and `queue.c`: The original interface and implementation for the queue data structure.
- `mangosteen.h` and `mangosteen.c`: The interface and implementation of the core Mangosteen library.
- `callbacks.c`: The client's implementations of the Mangosteen callbacks for this data structure (just `process_request` for this toy example). Callbacks may call functions from the original queue interface/implementation as normal (e.g. `enqueue` or `dequeue`).
- `stubs.c`: Stubs for the queue interface functions (i.e. `enqueue`/`dequeue`) that instead call into the Mangosteen shared library via `clientCmd`. These stubs could potentially be auto-generated from `queue.h`.
- `Makefile`: There are two options here: 1) `make all` and `make run` to build and run using static linking of the stubs object file. 2) `make all_dyn` and `make run_dyn` to build and run using LD_PRELOAD to dynamically link a shared library containing the stubs. In both cases, note the use of `-Wl,-Bsymbolic` when building the Mangosteen queue shared library. This ensures the linker binds symbol references inside the shared library to the symbols defined within the library itself. 
