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

# Utility rule file for check-cfi-and-supported.

# Include the progress variables for this target.
include projects/compiler-rt/test/cfi/CMakeFiles/check-cfi-and-supported.dir/progress.make

projects/compiler-rt/test/cfi/CMakeFiles/check-cfi-and-supported:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/daehee/fuzzcoin/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running the cfi regression tests"
	cd /home/daehee/fuzzcoin/build/projects/compiler-rt/test/cfi && /usr/bin/python2.7 /home/daehee/fuzzcoin/build/./bin/llvm-lit -sv --param check_supported=1 /home/daehee/fuzzcoin/build/projects/compiler-rt/test/cfi/Standalone-x86_64 /home/daehee/fuzzcoin/build/projects/compiler-rt/test/cfi/Devirt-x86_64 /home/daehee/fuzzcoin/build/projects/compiler-rt/test/cfi/Standalone-thinlto-x86_64 /home/daehee/fuzzcoin/build/projects/compiler-rt/test/cfi/Devirt-thinlto-x86_64

check-cfi-and-supported: projects/compiler-rt/test/cfi/CMakeFiles/check-cfi-and-supported
check-cfi-and-supported: projects/compiler-rt/test/cfi/CMakeFiles/check-cfi-and-supported.dir/build.make

.PHONY : check-cfi-and-supported

# Rule to build all files generated by this target.
projects/compiler-rt/test/cfi/CMakeFiles/check-cfi-and-supported.dir/build: check-cfi-and-supported

.PHONY : projects/compiler-rt/test/cfi/CMakeFiles/check-cfi-and-supported.dir/build

projects/compiler-rt/test/cfi/CMakeFiles/check-cfi-and-supported.dir/clean:
	cd /home/daehee/fuzzcoin/build/projects/compiler-rt/test/cfi && $(CMAKE_COMMAND) -P CMakeFiles/check-cfi-and-supported.dir/cmake_clean.cmake
.PHONY : projects/compiler-rt/test/cfi/CMakeFiles/check-cfi-and-supported.dir/clean

projects/compiler-rt/test/cfi/CMakeFiles/check-cfi-and-supported.dir/depend:
	cd /home/daehee/fuzzcoin/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/daehee/fuzzcoin/llvm /home/daehee/fuzzcoin/llvm/projects/compiler-rt/test/cfi /home/daehee/fuzzcoin/build /home/daehee/fuzzcoin/build/projects/compiler-rt/test/cfi /home/daehee/fuzzcoin/build/projects/compiler-rt/test/cfi/CMakeFiles/check-cfi-and-supported.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : projects/compiler-rt/test/cfi/CMakeFiles/check-cfi-and-supported.dir/depend
