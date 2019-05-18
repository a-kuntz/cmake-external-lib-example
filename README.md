# cmake external lib example

This is a working example project to demonstrate how to define a cmake target for a non-cmake external library.

## scenario

Our main file [src/main.cpp](src/main.cpp) is part of a cmake project, defined in [CMakeLists.txt](CMakeLists.txt). It depends on a non-cmake library `libfoo`. We compile `libfoo` with a simple makefile [foo/Makefile](foo/Makefile). To use `libfoo` in any project, the compiler and linker need to find the header file, and the archive file `libfoo.a`.

We would like to have a cmake target `Foo::Foo` for `libfoo` to make it accessible like any other cmake based library. This target is defined in [cmake/FindFoo.cmake](cmake/FindFoo.cmake), which is used by cmake to find `libfoo`. See line `find_package(Foo REQUIRED)` of [CMakeLists.txt](CMakeLists.txt). FindFoo.cmake is based on Daniel Pfeifers talk [Effective CMake](https://www.youtube.com/watch?v=bsXLMQ6WgIk) ([slide 22](https://github.com/boostcon/cppnow_presentations_2017/blob/master/05-19-2017_friday/effective_cmake__daniel_pfeifer__cppnow_05-19-2017.pdf)).

## build instructions

The easiest way to build the example is to simply run `build.sh` which contains the instructions below.

Build dependency `libfoo` via makefile located in folder foo.

```bash
make -C foo
```

Compile `src/main.cpp` using cmake. `libfoo` is found through `FindFoo.cmake`.

```bash
cmake -Bbuild -H.
make -C build
```

Invoke the built executable.

```bash
./build/main
```

Have fun exploring the example code.