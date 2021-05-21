# Install script for directory: /home/daehee/fuzzcoin/llvm/tools/opt-viewer

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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "opt-viewer")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opt-viewer" TYPE PROGRAM FILES "/home/daehee/fuzzcoin/llvm/tools/opt-viewer/opt-diff.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "opt-viewer")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opt-viewer" TYPE PROGRAM FILES "/home/daehee/fuzzcoin/llvm/tools/opt-viewer/opt-stats.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "opt-viewer")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opt-viewer" TYPE PROGRAM FILES "/home/daehee/fuzzcoin/llvm/tools/opt-viewer/opt-viewer.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "opt-viewer")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opt-viewer" TYPE PROGRAM FILES "/home/daehee/fuzzcoin/llvm/tools/opt-viewer/optpmap.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "opt-viewer")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opt-viewer" TYPE PROGRAM FILES "/home/daehee/fuzzcoin/llvm/tools/opt-viewer/optrecord.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "opt-viewer")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opt-viewer" TYPE PROGRAM FILES "/home/daehee/fuzzcoin/llvm/tools/opt-viewer/style.css")
endif()
