
# taken from google on how to compile prog X with openmp using cmake
find_package(OpenMP REQUIRED)

add_executable(test test.c)

# 2. Link the OpenMP target to your executable/library
# This handles both include directories and compiler/linker flags
if(OpenMP_CXX_FOUND)
    target_link_libraries(test PUBLIC OpenMP::OpenMP_CXX)
endif()

