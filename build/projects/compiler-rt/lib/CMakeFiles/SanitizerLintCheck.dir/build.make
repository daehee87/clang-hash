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

# Utility rule file for SanitizerLintCheck.

# Include the progress variables for this target.
include projects/compiler-rt/lib/CMakeFiles/SanitizerLintCheck.dir/progress.make

projects/compiler-rt/lib/CMakeFiles/SanitizerLintCheck: /home/daehee/fuzzcoin/llvm/projects/compiler-rt/lib/sanitizer_common/scripts/check_lint.sh
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/daehee/fuzzcoin/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running lint check for sanitizer sources..."
	cd /home/daehee/fuzzcoin/build/projects/compiler-rt/lib && env LLVM_CHECKOUT=/home/daehee/fuzzcoin/llvm SILENT=1 TMPDIR= PYTHON_EXECUTABLE=/usr/bin/python2.7 COMPILER_RT=/home/daehee/fuzzcoin/llvm/projects/compiler-rt /home/daehee/fuzzcoin/llvm/projects/compiler-rt/lib/sanitizer_common/scripts/check_lint.sh

SanitizerLintCheck: projects/compiler-rt/lib/CMakeFiles/SanitizerLintCheck
SanitizerLintCheck: projects/compiler-rt/lib/CMakeFiles/SanitizerLintCheck.dir/build.make

.PHONY : SanitizerLintCheck

# Rule to build all files generated by this target.
projects/compiler-rt/lib/CMakeFiles/SanitizerLintCheck.dir/build: SanitizerLintCheck

.PHONY : projects/compiler-rt/lib/CMakeFiles/SanitizerLintCheck.dir/build

projects/compiler-rt/lib/CMakeFiles/SanitizerLintCheck.dir/clean:
	cd /home/daehee/fuzzcoin/build/projects/compiler-rt/lib && $(CMAKE_COMMAND) -P CMakeFiles/SanitizerLintCheck.dir/cmake_clean.cmake
.PHONY : projects/compiler-rt/lib/CMakeFiles/SanitizerLintCheck.dir/clean

projects/compiler-rt/lib/CMakeFiles/SanitizerLintCheck.dir/depend:
	cd /home/daehee/fuzzcoin/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/daehee/fuzzcoin/llvm /home/daehee/fuzzcoin/llvm/projects/compiler-rt/lib /home/daehee/fuzzcoin/build /home/daehee/fuzzcoin/build/projects/compiler-rt/lib /home/daehee/fuzzcoin/build/projects/compiler-rt/lib/CMakeFiles/SanitizerLintCheck.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : projects/compiler-rt/lib/CMakeFiles/SanitizerLintCheck.dir/depend
