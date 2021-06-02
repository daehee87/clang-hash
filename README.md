# Fuzzcoin-LLVM

## Build

```
./make.sh -j4
```

## Run

```
./build/bin/clang -fsanitize=fuzzcoin test.c
```

## Implement Execution Hashing

Change under [llvm/projects/compiler-rt/lib/fuzzcoin](llvm/projects/compiler-rt/lib/fuzzcoin)

