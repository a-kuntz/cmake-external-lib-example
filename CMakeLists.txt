cmake_minimum_required(VERSION 3.10)

project(use-foo)

set(CMAKE_MODULE_PATH cmake)

set(FOO_ROOT ${CMAKE_CURRENT_LIST_DIR}/foo)
find_package(Foo REQUIRED)

add_executable(main src/main.cpp)
target_link_libraries(main Foo::Foo)
