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

# Utility rule file for check-lit.

# Include the progress variables for this target.
include utils/lit/CMakeFiles/check-lit.dir/progress.make

utils/lit/CMakeFiles/check-lit:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/daehee/fuzzcoin/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running lit's tests"
	cd /home/daehee/fuzzcoin/build/utils/lit && /usr/bin/python2.7 /home/daehee/fuzzcoin/build/./bin/llvm-lit -sv /home/daehee/fuzzcoin/build/utils/lit

check-lit: utils/lit/CMakeFiles/check-lit
check-lit: utils/lit/CMakeFiles/check-lit.dir/build.make

.PHONY : check-lit

# Rule to build all files generated by this target.
utils/lit/CMakeFiles/check-lit.dir/build: check-lit

.PHONY : utils/lit/CMakeFiles/check-lit.dir/build

utils/lit/CMakeFiles/check-lit.dir/clean:
	cd /home/daehee/fuzzcoin/build/utils/lit && $(CMAKE_COMMAND) -P CMakeFiles/check-lit.dir/cmake_clean.cmake
.PHONY : utils/lit/CMakeFiles/check-lit.dir/clean

utils/lit/CMakeFiles/check-lit.dir/depend:
	cd /home/daehee/fuzzcoin/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/daehee/fuzzcoin/llvm /home/daehee/fuzzcoin/llvm/utils/lit /home/daehee/fuzzcoin/build /home/daehee/fuzzcoin/build/utils/lit /home/daehee/fuzzcoin/build/utils/lit/CMakeFiles/check-lit.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : utils/lit/CMakeFiles/check-lit.dir/depend
