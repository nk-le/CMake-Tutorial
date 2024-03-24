cmake_minimum_required(VERSION 3.10)
project(teensy_cmake C CXX)

include(CMakePrintHelpers)

import_arduino_library(cores ${COREPATH})


add_subdirectory(examples)
# add custom library
# teensy_add_library(my_teensy_library my_teensy_library.cpp)

# teensy_add_executable(my_firmware sketch.ino)
# teensy_target_link_libraries(my_firmware my_teensy_library SD SdFat SPI cores) # order is IMPORTANT because we are garbage collecting symbols --gc-collect

# # if you need to link to std library (using <Vector>, etc) 
# set(CMAKE_EXE_LINKER_FLAGS "--specs=nano.specs" CACHE INTERNAL "")
# target_link_libraries(my_firmware.elf stdc++)


# > mkdir cmake-build-debug
# > cd cmake-build-debug
# > cmake .. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE:FILEPATH="../cmake/toolchains/teensy41.toolchain.cmake" 
# > make   