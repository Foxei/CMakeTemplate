# Custom find script for the library Third Party Library (TPL) that does not
# support cmake or provides only legacy features.
# The following variables are outputted by this script. Keep in mind, that this
# variables are for legacy cmake linking.

# ThirdPartyLibrary_FOUND
# ThirdPartyLibrary_INCLUDE_DIR
# ThirdPartyLibrary_DIR
# ThirdPartyLibrary_LIBRARY

# This script also outputs a INTERFACE IMPORTED library third_party_library that is used for modern
# linking and inclusion. 

include(FindPackageHandleStandardArgs)

find_path(ThirdPartyLibrary_INCLUDE_DIR third_party_library_header.hpp
        PATHS
        $ENV{ThirdPartyLibrary_DIR}
        /usr
        /usr/local
        /opt/local
        PATH_SUFFIXES
        /include
        DOC "The directory where third_party_library_header.hpp etc. resides.")
        
find_library(ThirdPartyLibrary_LIBRARY NAMES third_party_library
        PATHS
        $ENV{CPM_DIR}
        /usr
        /usr/local
        /opt/local
        PATH_SUFFIXES
        /lib
        DOC "The path where third_party_library resides.")

set(ThirdPartyLibrary_DIR)
get_filename_component(ThirdPartyLibrary_DIR "${CPM_INCLUDE_DIR}/../" ABSOLUTE)

find_package_handle_standard_args(ThirdPartyLibrary DEFAULT_MSG ThirdPartyLibrary_DIR_LIBRARY ThirdPartyLibrary_DIR_INCLUDE_DIR)
mark_as_advanced(ThirdPartyLibrary_DIR_FOUND ThirdPartyLibrary_DIR_INCLUDE_DIR ThirdPartyLibrary_DIR_LIBRARY ThirdPartyLibrary_DIR_DIR)

if (ThirdPartyLibrary_FOUND)
    add_library(third_party_library INTERFACE IMPORTED)
    target_link_libraries(third_party_library INTERFACE ${ThirdPartyLibrary_DIR})
    target_include_directories(third_party_library INTERFACE ${ThirdPartyLibrary_DIR})
endif ()
