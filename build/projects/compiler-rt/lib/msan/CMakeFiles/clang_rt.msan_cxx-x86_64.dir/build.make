# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/daehee/fuzzcoin/llvm

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/daehee/fuzzcoin/build

# Include any dependencies generated for this target.
include projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/depend.make

# Include the progress variables for this target.
include projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/progress.make

# Include the compile flags for this target's objects.
include projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/flags.make

projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/msan_new_delete.cc.o: projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/flags.make
projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/msan_new_delete.cc.o: /home/daehee/fuzzcoin/llvm/projects/compiler-rt/lib/msan/msan_new_delete.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/daehee/fuzzcoin/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/msan_new_delete.cc.o"
	cd /home/daehee/fuzzcoin/build/projects/compiler-rt/lib/msan && /usr/bin/clang++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/clang_rt.msan_cxx-x86_64.dir/msan_new_delete.cc.o -c /home/daehee/fuzzcoin/llvm/projects/compiler-rt/lib/msan/msan_new_delete.cc

projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/msan_new_delete.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/clang_rt.msan_cxx-x86_64.dir/msan_new_delete.cc.i"
	cd /home/daehee/fuzzcoin/build/projects/compiler-rt/lib/msan && /usr/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/daehee/fuzzcoin/llvm/projects/compiler-rt/lib/msan/msan_new_delete.cc > CMakeFiles/clang_rt.msan_cxx-x86_64.dir/msan_new_delete.cc.i

projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/msan_new_delete.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/clang_rt.msan_cxx-x86_64.dir/msan_new_delete.cc.s"
	cd /home/daehee/fuzzcoin/build/projects/compiler-rt/lib/msan && /usr/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/daehee/fuzzcoin/llvm/projects/compiler-rt/lib/msan/msan_new_delete.cc -o CMakeFiles/clang_rt.msan_cxx-x86_64.dir/msan_new_delete.cc.s

projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/msan_new_delete.cc.o.requires:

.PHONY : projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/msan_new_delete.cc.o.requires

projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/msan_new_delete.cc.o.provides: projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/msan_new_delete.cc.o.requires
	$(MAKE) -f projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/build.make projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/msan_new_delete.cc.o.provides.build
.PHONY : projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/msan_new_delete.cc.o.provides

projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/msan_new_delete.cc.o.provides.build: projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/msan_new_delete.cc.o


# Object files for target clang_rt.msan_cxx-x86_64
clang_rt_msan_cxx__x86_64_OBJECTS = \
"CMakeFiles/clang_rt.msan_cxx-x86_64.dir/msan_new_delete.cc.o"

# External object files for target clang_rt.msan_cxx-x86_64
clang_rt_msan_cxx__x86_64_EXTERNAL_OBJECTS = \
"/home/daehee/fuzzcoin/build/projects/compiler-rt/lib/ubsan/CMakeFiles/RTUbsan_cxx.x86_64.dir/ubsan_handlers_cxx.cc.o" \
"/home/daehee/fuzzcoin/build/projects/compiler-rt/lib/ubsan/CMakeFiles/RTUbsan_cxx.x86_64.dir/ubsan_type_hash.cc.o" \
"/home/daehee/fuzzcoin/build/projects/compiler-rt/lib/ubsan/CMakeFiles/RTUbsan_cxx.x86_64.dir/ubsan_type_hash_itanium.cc.o" \
"/home/daehee/fuzzcoin/build/projects/compiler-rt/lib/ubsan/CMakeFiles/RTUbsan_cxx.x86_64.dir/ubsan_type_hash_win.cc.o"

lib/clang/6.0.0/lib/linux/libclang_rt.msan_cxx-x86_64.a: projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/msan_new_delete.cc.o
lib/clang/6.0.0/lib/linux/libclang_rt.msan_cxx-x86_64.a: projects/compiler-rt/lib/ubsan/CMakeFiles/RTUbsan_cxx.x86_64.dir/ubsan_handlers_cxx.cc.o
lib/clang/6.0.0/lib/linux/libclang_rt.msan_cxx-x86_64.a: projects/compiler-rt/lib/ubsan/CMakeFiles/RTUbsan_cxx.x86_64.dir/ubsan_type_hash.cc.o
lib/clang/6.0.0/lib/linux/libclang_rt.msan_cxx-x86_64.a: projects/compiler-rt/lib/ubsan/CMakeFiles/RTUbsan_cxx.x86_64.dir/ubsan_type_hash_itanium.cc.o
lib/clang/6.0.0/lib/linux/libclang_rt.msan_cxx-x86_64.a: projects/compiler-rt/lib/ubsan/CMakeFiles/RTUbsan_cxx.x86_64.dir/ubsan_type_hash_win.cc.o
lib/clang/6.0.0/lib/linux/libclang_rt.msan_cxx-x86_64.a: projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/build.make
lib/clang/6.0.0/lib/linux/libclang_rt.msan_cxx-x86_64.a: projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/daehee/fuzzcoin/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library ../../../../lib/clang/6.0.0/lib/linux/libclang_rt.msan_cxx-x86_64.a"
	cd /home/daehee/fuzzcoin/build/projects/compiler-rt/lib/msan && $(CMAKE_COMMAND) -P CMakeFiles/clang_rt.msan_cxx-x86_64.dir/cmake_clean_target.cmake
	cd /home/daehee/fuzzcoin/build/projects/compiler-rt/lib/msan && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/clang_rt.msan_cxx-x86_64.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/build: lib/clang/6.0.0/lib/linux/libclang_rt.msan_cxx-x86_64.a

.PHONY : projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/build

projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/requires: projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/msan_new_delete.cc.o.requires

.PHONY : projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/requires

projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/clean:
	cd /home/daehee/fuzzcoin/build/projects/compiler-rt/lib/msan && $(CMAKE_COMMAND) -P CMakeFiles/clang_rt.msan_cxx-x86_64.dir/cmake_clean.cmake
.PHONY : projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/clean

projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/depend:
	cd /home/daehee/fuzzcoin/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/daehee/fuzzcoin/llvm /home/daehee/fuzzcoin/llvm/projects/compiler-rt/lib/msan /home/daehee/fuzzcoin/build /home/daehee/fuzzcoin/build/projects/compiler-rt/lib/msan /home/daehee/fuzzcoin/build/projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : projects/compiler-rt/lib/msan/CMakeFiles/clang_rt.msan_cxx-x86_64.dir/depend
