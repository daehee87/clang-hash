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

# Utility rule file for install-llvm-profdata.

# Include the progress variables for this target.
include tools/llvm-profdata/CMakeFiles/install-llvm-profdata.dir/progress.make

tools/llvm-profdata/CMakeFiles/install-llvm-profdata: bin/llvm-profdata
	cd /home/daehee/fuzzcoin/build/tools/llvm-profdata && /usr/bin/cmake -DCMAKE_INSTALL_COMPONENT="llvm-profdata" -P /home/daehee/fuzzcoin/build/cmake_install.cmake

install-llvm-profdata: tools/llvm-profdata/CMakeFiles/install-llvm-profdata
install-llvm-profdata: tools/llvm-profdata/CMakeFiles/install-llvm-profdata.dir/build.make

.PHONY : install-llvm-profdata

# Rule to build all files generated by this target.
tools/llvm-profdata/CMakeFiles/install-llvm-profdata.dir/build: install-llvm-profdata

.PHONY : tools/llvm-profdata/CMakeFiles/install-llvm-profdata.dir/build

tools/llvm-profdata/CMakeFiles/install-llvm-profdata.dir/clean:
	cd /home/daehee/fuzzcoin/build/tools/llvm-profdata && $(CMAKE_COMMAND) -P CMakeFiles/install-llvm-profdata.dir/cmake_clean.cmake
.PHONY : tools/llvm-profdata/CMakeFiles/install-llvm-profdata.dir/clean

tools/llvm-profdata/CMakeFiles/install-llvm-profdata.dir/depend:
	cd /home/daehee/fuzzcoin/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/daehee/fuzzcoin/llvm /home/daehee/fuzzcoin/llvm/tools/llvm-profdata /home/daehee/fuzzcoin/build /home/daehee/fuzzcoin/build/tools/llvm-profdata /home/daehee/fuzzcoin/build/tools/llvm-profdata/CMakeFiles/install-llvm-profdata.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/llvm-profdata/CMakeFiles/install-llvm-profdata.dir/depend
