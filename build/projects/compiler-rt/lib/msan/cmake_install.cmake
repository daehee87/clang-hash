# Install script for directory: /home/daehee/fuzzcoin/llvm/projects/compiler-rt/lib/msan

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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "clang_rt.msan-x86_64")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/6.0.0/lib/linux" TYPE STATIC_LIBRARY FILES "/home/daehee/fuzzcoin/build/lib/clang/6.0.0/lib/linux/libclang_rt.msan-x86_64.a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "clang_rt.msan_cxx-x86_64")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/6.0.0/lib/linux" TYPE STATIC_LIBRARY FILES "/home/daehee/fuzzcoin/build/lib/clang/6.0.0/lib/linux/libclang_rt.msan_cxx-x86_64.a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/6.0.0/lib/linux" TYPE FILE FILES "/home/daehee/fuzzcoin/build/lib/clang/6.0.0/lib/linux/libclang_rt.msan-x86_64.a.syms")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/6.0.0/lib/linux" TYPE FILE FILES "/home/daehee/fuzzcoin/build/lib/clang/6.0.0/lib/linux/libclang_rt.msan_cxx-x86_64.a.syms")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "msan")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/6.0.0" TYPE FILE FILES "/home/daehee/fuzzcoin/llvm/projects/compiler-rt/lib/msan/msan_blacklist.txt")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/daehee/fuzzcoin/build/projects/compiler-rt/lib/msan/tests/cmake_install.cmake")

endif()
