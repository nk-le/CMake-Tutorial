set(TEENSY_VERSION 41 CACHE STRING "Set to the Teensy version corresponding to your board (40 or 41 allowed)" FORCE)
set(CPU_CORE_SPEED 600000000 CACHE STRING "Set to 600000000, 24000000, 48000000, 72000000 or 96000000 to set CPU core speed" FORCE) # Derived variables
set(COMPILERPATH "${CMAKE_CURRENT_SOURCE_DIR}/tools/gcc-arm-none-eabi-10-2020-q4-major/bin/") # path to the gcc compiler 
set(DEPSPATH "${CMAKE_CURRENT_SOURCE_DIR}/deps/")
set(COREPATH "${DEPSPATH}/cores/teensy4/") # path to the teensy cores

# appending the teensy_cmake_macros as config package
include(CMakePrintHelpers)
list(APPEND CMAKE_PREFIX_PATH ${CMAKE_CURRENT_LIST_DIR}/teensy_cmake_macros)
cmake_print_variables(CMAKE_PREFIX_PATH)
cmake_print_variables(COMPILERPATH)

find_package(teensy_cmake_macros CONFIG REQUIRED)



# calling
# cmake .. -G "MinGW Makefiles" -DCMAKE_TOOLCHAIN_FILE:FILEPATH="../cmake/toolchains/teensy41.toolchain.cmake" --fresh