#!/bin/bash

parallel=1
use_clang=0
use_gold=0
build_type="RELEASE"
do_install=0
install_path=""
target_arch="X86"

# Prefer clang+gold over gcc+ld for faster build.
command -v clang 2>&1 1>/dev/null && use_clang=1
command -v gold 2>&1 1>/dev/null && use_gold=1

while [[ $# -gt 0 ]]
do
    key="$1"
    case $key in
        -j)
            parallel="$2"
            shift 2 ;;
        -j*)
            parallel="${1:2}"
            shift ;;
        -d|--debug)
            build_type="DEBUG"
            shift ;;
        -i|--install)
            do_install=1
            install_path="$2"
            shift 2 ;;
        -t|--target)
            target_arch="$2"
            shift 2 ;;
        *)
            shift ;;
    esac
done

compiler_option=""
[ $use_clang -ne 0 ] && compiler_option="-DCMAKE_C_COMPILER=clang \
                                         -DCMAKE_CXX_COMPILER=clang++"

linker_option=""
[ $use_gold -ne 0 ] && linker_option="-DLLVM_USE_LINKER=gold"

set -ex

mkdir -p build
cd build

cmake -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE="$build_type" \
    -DLLVM_TARGETS_TO_BUILD="$target_arch" \
    -DLLVM_OPTIMIZED_TABLEGEN=On \
    $compiler_option \
    $linker_option \
    ../llvm

make -j$parallel

if [[ $do_install -ne 0 ]]; then
    cmake -DCMAKE_INSTALL_PREFIX="$install_path" -P cmake_install.cmake
fi
