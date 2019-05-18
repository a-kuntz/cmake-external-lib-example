message(STATUS "FindFoo: FOO_ROOT=${FOO_ROOT}")

find_path(Foo_INCLUDE_DIR foo.h "${FOO_ROOT}/include")
find_library(Foo_LIBRARY libfoo.a "${FOO_ROOT}")
mark_as_advanced(Foo_INCLUDE_DIR Foo_LIBRARY)

message(STATUS "FindFoo: Foo_INCLUDE_DIR=${Foo_INCLUDE_DIR}")
message(STATUS "FindFoo: Foo_LIBRARY=${Foo_LIBRARY}")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Foo
    REQUIRED_VARS Foo_LIBRARY Foo_INCLUDE_DIR
)

if (Foo_FOUND AND NOT TARGET Foo::Foo)
    add_library(Foo::Foo UNKNOWN IMPORTED)
    set_target_properties(Foo::Foo PROPERTIES
        IMPORTED_LINK_INTERFACE_LANGUAGES "CXX"
        IMPORTED_LOCATION "${Foo_LIBRARY}"
        INTERFACE_INCLUDE_DIRECTORIES "${Foo_INCLUDE_DIR}"
    )
    message(STATUS "FindFoo: defined target Foo::Foo PROPERTIES")
    message(STATUS "    IMPORTED_LINK_INTERFACE_LANGUAGES=CXX")
    message(STATUS "    IMPORTED_LOCATION=${Foo_LIBRARY}")
    message(STATUS "    INTERFACE_INCLUDE_DIRECTORIES=${Foo_INCLUDE_DIR}")
endif()
