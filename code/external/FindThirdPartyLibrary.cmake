# Custom find script for the library Third Party Library (TPL) that does not
# support cmake or provides only legacy features.
# The following variables are outputted by this script. Keep in mind, that this
# variables are for legacy cmake linking.
# TPL_FOUND
# TPL_INCLUDE_DIR
# TPL_DIR
# CPM_LIBRARY
# This script also outputs a INTERFACE IMPORTED library that is used for modern
# linking and inclusion.

set(ThirdPartyLibrary_VERSION 1.0)


include(FindPackageHandleStandardArgs)

find_path(CPM_INCLUDE_DIR cpm/AsyncReader.hpp

        PATHS
        $ENV{CPM_DIR}
        $ENV{HOME}/dev/software/cpm_lib/
        /home/cpm/dev/software/cpm_lib/
        /usr
        /usr/local
        /opt/local

        PATH_SUFFIXES
        /include

        DOC "The directory where cpm/AsyncReader.hpp etc. resides")

find_library(CPM_LIBRARY NAMES cpm

        HINTS
        ${CPM_INCLUDE_DIR}/../build/

        PATHS
        $ENV{CPM_DIR}
        /usr
        /usr/local
        /sw
        /opt/local

        PATH_SUFFIXES
        /lib
        /lib${CPM_PF}
        /build/code
        /build-debug/code

        DOC "The cpm library")

set(CPM_DIR)
get_filename_component(CPM_DIR "${CPM_INCLUDE_DIR}/../" ABSOLUTE)

find_package_handle_standard_args(CPM DEFAULT_MSG CPM_LIBRARY CPM_INCLUDE_DIR)
mark_as_advanced(CPM_FOUND CPM_INCLUDE_DIR CPM_LIBRARY CPM_DIR)

if (CPM_FOUND)
    add_library(cpm INTERFACE IMPORTED)
    target_link_libraries(cpm INTERFACE ${CPM_LIBRARY})
    target_include_directories(cpm INTERFACE ${CPM_INCLUDE_DIR})
endif ()
