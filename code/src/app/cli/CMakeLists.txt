# This is the magic of a good CMake library script. Using the library is as easy
# as a singel line

# Define new executable. In general the executable only contains the code that is
# interacting with the user and the library containts the functionality
add_executable(example_cli src/example_cli.cpp)

# Linking the library to our exectuable. This implicitly does a bunch more thinks # for us. It includes the headers and fixes the linking path to that the excutable # may me moved indipendently from the library file.
target_link_libraries(example_cli example_project)