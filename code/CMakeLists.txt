# At least 3.12 so that IMPORTED targets and FetchContent can be used.
cmake_minimum_required(VERSION 3.12 FATAL_ERROR)

# Specify the project the used language and the version. Keep in mind, that explicitly defining the languages used may exclude features implicitly. 
project(ExampleProject VERSION 0.1 LANGUAGES CXX)

# Set CMake to enforce C++11/14/17/20. If the compiler does not support it,
# you will get an error.
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED 14)

# Allow CMake to locate our script for the local third party library
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/external)

# Import installation directories for the all executable and libraries
include(GNUInstallDirs)

# Find boost and make IMPORTED boost targets available
find_package(Boost REQUIRED COMPONENTS date_time filesystem)
# Communicate to the user, that boost was found and which version is used
message(STATUS "Boost found version: ${Boost_VERSION}")

# Include Qt5 as an imported target
find_package(Qt5 5.15 COMPONENTS Widgets Svg REQUIRED)
message(STATUS "Qt5 found version: ${Qt5_VERSION}")

# Find the local third party library
find_package(ThirdPartyLibrary)
# Communicate to the use, that ThirdPartyLibrary was found and which version
# is used
message(STATUS "ThirdPartyLibrary found: ${ThirdPartyLibrary_FOUND}")

# Go to the source of this project and call the CMakeLists.txt from the subdirectory
add_subdirectory(src)