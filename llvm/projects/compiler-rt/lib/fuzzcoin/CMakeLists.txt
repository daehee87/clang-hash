add_compiler_rt_component(fuzzcoin)

include_directories(..)
include_directories(.)

set(FUZZCOIN_CFLAGS -fPIC ${SANITIZER_COMMON_CFLAGS})

add_compiler_rt_object_libraries(RTFuzzcoinLib
  OS ${SANITIZER_COMMON_SUPPORTED_OS}
  ARCHS x86_64
  SOURCES fuzzcoin.cpp
  CFLAGS ${FUZZCOIN_CFLAGS})

add_compiler_rt_runtime(clang_rt.fuzzcoin
  STATIC
  ARCHS x86_64
  OBJECT_LIBS RTFuzzcoinLib
  CFLAGS ${FUZZCOIN_CFLAGS}
  PARENT_TARGET fuzzcoin)
