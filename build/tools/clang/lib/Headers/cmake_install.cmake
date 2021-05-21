# Install script for directory: /home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RELEASE")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "clang-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/6.0.0/include" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/adxintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/altivec.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/ammintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/arm_acle.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/armintr.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/arm64intr.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx2intrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512bwintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512bitalgintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512vlbitalgintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512cdintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512vpopcntdqintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512dqintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512erintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512fintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512ifmaintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512ifmavlintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512pfintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512vbmiintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512vbmivlintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512vbmi2intrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512vlvbmi2intrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512vlbwintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512vlcdintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512vldqintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512vlintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512vpopcntdqvlintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512vnniintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avx512vlvnniintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/avxintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/bmi2intrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/bmiintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/__clang_cuda_builtin_vars.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/__clang_cuda_cmath.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/__clang_cuda_complex_builtins.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/__clang_cuda_intrinsics.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/__clang_cuda_math_forward_declares.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/__clang_cuda_runtime_wrapper.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/cetintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/clzerointrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/cpuid.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/clflushoptintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/clwbintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/emmintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/f16cintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/float.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/fma4intrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/fmaintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/fxsrintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/gfniintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/htmintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/htmxlintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/ia32intrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/immintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/intrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/inttypes.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/iso646.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/limits.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/lwpintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/lzcntintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/mm3dnow.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/mmintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/mm_malloc.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/module.modulemap"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/msa.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/mwaitxintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/nmmintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/opencl-c.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/pkuintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/pmmintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/popcntintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/prfchwintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/rdseedintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/rtmintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/s390intrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/shaintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/smmintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/stdalign.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/stdarg.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/stdatomic.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/stdbool.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/stddef.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/__stddef_max_align_t.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/stdint.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/stdnoreturn.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/tbmintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/tgmath.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/tmmintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/unwind.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/vadefs.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/vaesintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/varargs.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/vecintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/vpclmulqdqintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/wmmintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/__wmmintrin_aes.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/__wmmintrin_pclmul.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/x86intrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/xmmintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/xopintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/xsavecintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/xsaveintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/xsaveoptintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/xsavesintrin.h"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/xtestintrin.h"
    "/home/daehee/fuzzcoin/build/tools/clang/lib/Headers/arm_neon.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "clang-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/6.0.0/include/cuda_wrappers" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/cuda_wrappers/algorithm"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/cuda_wrappers/complex"
    "/home/daehee/fuzzcoin/llvm/tools/clang/lib/Headers/cuda_wrappers/new"
    )
endif()

