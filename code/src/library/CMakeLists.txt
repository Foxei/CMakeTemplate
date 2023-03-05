# Define the library as separate project but it may is depending on the
# libraries found in the top-level file. Be aware how 
project(libexample_project VERSION 0.1 LANGUAGES CXX)

# Crate the library. Only provide source files here! Header are sorted
# separately.
add_library(example_project SHARED
        src/ExamplePublicLibraryClass.cpp
        src/ExamplePrivateLibraryClass.cpp)

# Define headers for this library. PUBLIC headers are used for compiling the
# library, and will be added to consumers' build paths.
target_include_directories(example_project PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
        PRIVATE src)

# If we have compiler special requirements for this library, list them here
target_compile_features(example_project
        PUBLIC cxx_auto_type
        PRIVATE cxx_variadic_templates)

# This library is depend on a library that we defined in the top-level file.
# Link it here! This link will automatically include the headers for us if
# the linked library supports it 
target_link_libraries(example_project Boost::boost)

# 'make install' to the correct locations (provided by GNUInstallDirs).
install(TARGETS example_project EXPORT ExampleProjectConfig
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})  # This is for Windows
install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

# This makes the project importable from the install directory put config file
# in per-project dir (name MUST match), can also just go into 'cmake'.
install(EXPORT ExampleProjectConfig DESTINATION share/ExampleProject/cmake)

# This makes the project importable from the build directory
export(TARGETS example_project FILE ExampleProjectConfig.cmake)