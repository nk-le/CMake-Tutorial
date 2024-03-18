cmake_minimum_required(VERSION 3.9)

project(myCoolProj
        VERSION 1.0
        LANGUAGES CXX)

if(NOT WIN32)
    string(ASCII 27 Esc)
    set(ColourReset "${Esc}[m")
    set(ColourBold  "${Esc}[1m")
    set(Red         "${Esc}[31m")
    set(Green       "${Esc}[32m")
    set(Yellow      "${Esc}[33m")
    set(Blue        "${Esc}[34m")
    set(Magenta     "${Esc}[35m")
    set(Cyan        "${Esc}[36m")
    set(White       "${Esc}[37m")
    set(BoldRed     "${Esc}[1;31m")
    set(BoldGreen   "${Esc}[1;32m")
    set(BoldYellow  "${Esc}[1;33m")
    set(BoldBlue    "${Esc}[1;34m")
    set(BoldMagenta "${Esc}[1;35m")
    set(BoldCyan    "${Esc}[1;36m")
set(BoldWhite   "${Esc}[1;37m")
endif()

add_executable(myCoolProj
    src/engine.hpp
    src/engine.cpp
    src/utils.hpp
    src/utils.cpp
    src/main.cpp)

target_compile_features(myCoolProj PRIVATE cxx_std_20)
target_compile_definitions(myCoolProj PRIVATE USE_NEW_AUDIO_ENGINE) 

target_compile_options(myCoolProj PRIVATE -Wall -Wextra -Wpedantic)


#dependency management
find_library(LIBRARY_SDL sdl)
if (LIBRARY_SDL)
    message("Found library at $(PROJECT_SOURCE_DIR). Linking ...")    
    target_link_libraries(myCoolProj PRIVATE ${LIBRARY_SDL})
else()
message("${Red}Library not found!${ColourReset}")
    # throw an error or enable compilation without the library
endif()

find_package(SDL)

# OS specific code
if (CMAKE_SYSTEM_NAME STREQUAL "Windows")
    target_compile_options(myCoolProj PRIVATE /W4)
elseif (CMAKE_SYSTEM_NAME STREQUAL "Linux")
    target_compile_options(myCoolProj PRIVATE -Wall -Wextra -Wpedantic)
elseif (CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    # other macOS-specific flags for Clang
endif()