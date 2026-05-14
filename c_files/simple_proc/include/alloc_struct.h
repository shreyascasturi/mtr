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
struct page_track** create_track_arr(int8_t* starting_addr) {
	/** 
	 * the array contains a series of page track ptrs
	 * an array is a series of addresses
	 * thus each address contains another address
	 * the type of the array addr is struct page_track**
	 * dereferencing an array addr gives you the struct page_track* ptr.
	 *  there are NUM_PAGES page_track structs
	 *  	   
	 **/ 

	struct page_track** page_track_arr = malloc(sizeof(struct page_track*) * NUM_PAGES);
	if (page_track_arr == NULL) {
		printf("total page track failure\n");
		exit(1);
	}
	// set each page_track array element
	for (int i = 0; i < NUM_PAGES; i++) {
		
		// malloc page_track_ptr, set values
		struct page_track* page_track_ptr = malloc(sizeof(struct page_track));
		page_track_ptr->dirty_bit_ = false;
		page_track_ptr->proc_ptr_ = NULL;
		
		// set the memory address it's tracking
		page_track_ptr->memptr_ = starting_addr + (PAGE_SIZE_BYTES * i);
		
		// we are setting the contents of the address 
		// to be a ptr to a page_track_struct
		// thus, we must do *(page_track_arr + offset)
		int page_track_offset = i * sizeof(struct page_track*);
		*(page_track_arr + page_track_offset) = page_track_ptr;
	}
	return page_track_arr;

}

void free_page_track_arr(struct page_track** track_arr) {
	/**
	 * free page_track_arr;
	 */
	for (int i = 0; i < NUM_PAGES; i++) {
		// free each individual page_track struct
		printf("%d", i);
		printf("\n");
		struct page_track* track = *(track_arr + (i * sizeof(struct page_track*)));
		free(track);
	}
	free(track_arr);
	

}
#endif
