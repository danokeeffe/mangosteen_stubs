CC = gcc
CFLAGS = -fPIC -Wall -Wextra

all: libcallbacks.so stubs.o main


# Step 1: Build the shared library
libcallbacks.so: callbacks.c queue.c
	$(CC) $(CFLAGS) -shared -Wl,-Bsymbolic -o libcallbacks.so callbacks.c mangosteen.c queue.c

# Step 2: Build the static interposer object
stubs.o: stubs.c
	$(CC) $(CFLAGS) -c stubs.c -o stubs.o

# Step 3: Build the main app with interposer statically linked before the shared lib
main: main.c stubs.o libcallbacks.so
	$(CC) -o main main.c stubs.o -L. -lcallbacks

# Step 4: Run
run: main
	LD_LIBRARY_PATH=. ./main

clean:
	rm -f *.o *.so main
