# At least 3.10 so that IMPORTED targets can be used
cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

# Specify the project the used language and the version
project(ExampleProject VERSION 0.1 LANGUAGES CXX)

# Set CMake to enforce C++14
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED 14)

# Allow CMake to locate our script for the local third party library
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/external)

# Import installation directories for the all executable and libraries
include(GNUInstallDirs)

# Find boost and make IMPORTED boost targets available
find_package(Boost REQUIRED COMPONENTS date_time filesystem)
# Communicate to the use, that boost was found and which version he is used
message(STATUS "Boost found version: ${Boost_VERSION}")

# Find the local third party library
find_package(ThirdPartyLibrary REQUIRED)
# Communicate to the use, that ThirdPartyLibrary was found and which version is used
message(STATUS "ThirdPartyLibrary found version: ${ThirdPartyLibrary_VERSION}")

# Go to the source of this project and call the CMakeLists.txt from the subdirectory
add_subdirectory(src)