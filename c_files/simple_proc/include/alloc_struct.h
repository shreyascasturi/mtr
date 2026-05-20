#ifndef ALLOC_STRUCT_H
#define ALLOC_STRUCT_H

#include "proc.h"
#include "constants.h"
#include <stdlib.h>
#include <stdbool.h>

struct page_track {
	int8_t* memptr_;
	struct proc* proc_ptr_;
	//int64_t* duration_;
	bool dirty_bit_;
};

// given a starting address
// create an array of page track ptrs
struct page_track** create_track_arr(int8_t* starting_addr);

// check if page_array has any free pages (check if page_track structs
// are all marked unfree). Return true if any are free, else false.
bool check_if_free(struct page_track** page_arr);

// given a track array, free the array and all individual pointers.
void free_page_track_arr(struct page_track** track_arr);

#endif
