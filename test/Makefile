CC=../build/bin/clang
CXX=../build/bin/clang++
CFLAGS=-fsanitize=fuzzcoin -fno-strict-aliasing

all: test

test: test.c
	$(CC) $(CFLAGS) -o $@ $<

