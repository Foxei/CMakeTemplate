# Enable Qt5 cmake
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# Make cmake to find own .ui file
set(CMAKE_AUTOUIC_SEARCH_PATHS ${CMAKE_CURRENT_SOURCE_DIR}/ui/)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(FRAMEWORK_RES frameworks/logo.icns)

# Define an executable
add_executable(example_ui
        resources/application_resources.qrc
        src/main.cpp
        src/MainWindow.cpp
        ${FRAMEWORK_RES})

# Set platform specific linker options
target_link_libraries(example_ui PRIVATE Qt5::Widgets Qt5::Svg example_project)

# Setting platform specific post build options
if (APPLE)
    set(CMAKE_EXE_LINKER_FLAGS "-framework ServiceManagement -framework Foundation -framework Cocoa")
    # Setting application meta information
    set_target_properties(example_ui PROPERTIES MACOSX_BUNDLE TRUE)
    set_target_properties(example_ui PROPERTIES MACOSX_BUNDLE_BUNDLE_NAME "Example Ui")
    set_target_properties(example_ui PROPERTIES MACOSX_BUNDLE_EXECUTABLE_NAME "Example Ui")
    set_target_properties(example_ui PROPERTIES OUTPUT_NAME "Example Ui")
    set_target_properties(example_ui PROPERTIES MACOSX_BUNDLE_INFO_STRING "Example Ui - Version ${PROJECT_VERSION}")
    set_target_properties(example_ui PROPERTIES MACOSX_BUNDLE_BUNDLE_VERSION "${PROJECT_VERSION}")
    set_target_properties(example_ui PROPERTIES MACOSX_BUNDLE_LONG_VERSION_STRING "${PROJECT_VERSION}")
    set_target_properties(example_ui PROPERTIES MACOSX_BUNDLE_SHORT_VERSION_STRING "${PROJECT_VERSION}")
    set_target_properties(example_ui PROPERTIES MACOSX_BUNDLE_GUI_IDENTIFIER "Simon Schäfer")
    set_target_properties(example_ui PROPERTIES MACOSX_BUNDLE_COPYRIGHT "Copyright © 2023 Simon Schäfer. All rights reserved.")
    #
    set_source_files_properties(${FRAMEWORK_RES} PROPERTIES MACOSX_PACKAGE_LOCATION Resources/)
    set_target_properties(example_ui PROPERTIES MACOSX_BUNDLE_ICON_FILE "logo.icns")

    set_target_properties(example_ui PROPERTIES MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_SOURCE_DIR}/frameworks/MacOSXBundleInfo.plist.in")
elseif (UNIX)
    # Fix double click bug
    set(CMAKE_EXE_LINKER_FLAGS -no-pie)

    # Setting application meta information
    set(PROJECT_PATH "${CMAKE_BINARY_DIR}/example_ui")
    set(PROJECT_ICON "${CMAKE_BINARY_DIR}/logo.png")

    # Copy launcher files
    file(COPY ${CMAKE_SOURCE_DIR}/frameworks/logo.png DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/)
    configure_file(${CMAKE_SOURCE_DIR}/frameworks/linux-launcher.desktop.in $linux-launcher.desktop)
endif ()
