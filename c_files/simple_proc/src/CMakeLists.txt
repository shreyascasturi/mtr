
# add_library(alloc_struct alloc_struct.c)
# # TODO: learn about linking and other things... why does this work?
# # originally, I did: add_executable(proc proc.c alloc_struct.c)
# # now, we've done add_library followed by add_executable followed by target_link_libraries
# add_executable(proc proc.c)
# target_link_libraries(proc PRIVATE alloc_struct)

# also doable
add_executable(proc proc.c alloc_struct.c)
