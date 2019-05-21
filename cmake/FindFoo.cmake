message(STATUS "FindFoo: FOO_ROOT=${FOO_ROOT}")
message(STATUS "FindFoo: Foo_FIND_COMPONENTS=${Foo_FIND_COMPONENTS}")

# find core components
find_path(Foo_INCLUDE_DIR foo.h "${FOO_ROOT}/include")
find_library(Foo_LIBRARY libfoo.a "${FOO_ROOT}")
message(STATUS "FindFoo: Foo_INCLUDE_DIR=${Foo_INCLUDE_DIR}")
message(STATUS "FindFoo: Foo_LIBRARY=${Foo_LIBRARY}")

# find components
foreach(CMP ${Foo_FIND_COMPONENTS})
    string(TOLOWER ${CMP} cmp)
    find_library(${CMP}_LIBRARY lib${cmp}.a "${FOO_ROOT}")
    list(APPEND CMP_LIBS ${${CMP}_LIBRARY})
endforeach(CMP)
message(STATUS "FindFoo: CMP_LIBS=${CMP_LIBS}")

mark_as_advanced(Foo_INCLUDE_DIR Foo_LIBRARY CMP_LIBS)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Foo
    REQUIRED_VARS Foo_LIBRARY Foo_INCLUDE_DIR
)

if (Foo_FOUND AND NOT TARGET Foo::Foo)
    add_library(Foo::Foo UNKNOWN IMPORTED)
    set_target_properties(Foo::Foo PROPERTIES
        IMPORTED_LINK_INTERFACE_LANGUAGES "CXX"
        IMPORTED_LOCATION ${Foo_LIBRARY}
        INTERFACE_INCLUDE_DIRECTORIES "${Foo_INCLUDE_DIR}"
        INTERFACE_LINK_LIBRARIES "${CMP_LIBS}"
    )
endif()