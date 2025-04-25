CC = gcc
CFLAGS = -fPIC -Wall -Wextra

all: libmangoQueue.so stubs.o main


# Step 1: Build the Mangosteen and data structure implementation shared library
libmangoQueue.so: callbacks.c mangosteen.c queue.c
	$(CC) $(CFLAGS) -shared -Wl,-Bsymbolic -o libmangoQueue.so callbacks.c mangosteen.c queue.c

# Step 2: Build the static stubs object
stubs.o: stubs.c
	$(CC) $(CFLAGS) -c stubs.c -o stubs.o

# Step 3: Build the main app with stubs statically linked before the shared lib
main: main.c stubs.o libmangoQueue.so
	$(CC) -o main main.c stubs.o -L. -lcallbacks

# Step 4: Run
run: main
	LD_LIBRARY_PATH=. ./main

clean:
	rm -f *.o *.so main
