cmake_minimum_required(VERSION 3.10)
project(test1)
add_definitions(-DPROG_FLASH_SIZE=10000)
teensy_include_directories(../../src)
teensy_add_executable(mainTest1 main.cpp)
teensy_target_link_libraries(mainTest1 cores)