CC=../build/bin/clang
CXX=../build/bin/clang++
CFLAGS=-fsanitize=fuzzcoin

all: test bof cpptest

test: test.c
	$(CC) $(CFLAGS) -o $@ $<

bof: bof.c
	$(CC) $(CFLAGS),address -o $@ $<

cpptest: cpptest.cpp
	$(CXX) $(CFLAGS),address -o $@ $<

clean:
	rm *.cov test bof cpptest
