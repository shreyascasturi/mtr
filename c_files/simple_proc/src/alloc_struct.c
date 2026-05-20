#include "../include/alloc_struct.h"

struct page_track** create_track_arr(int8_t* starting_addr) {
	/** 
	 * the array contains a series of page track ptrs
	 * an array is a series of addresses that have some contents at each address.
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
		if (page_track_ptr == NULL) {
			printf("page_Track_ptr alloc failed!\n ");
			exit(1);
		}
		page_track_ptr->dirty_bit_ = false;
		page_track_ptr->proc_ptr_ = NULL;
		
		// set the memory address it's tracking
		page_track_ptr->memptr_ = starting_addr + (PAGE_SIZE_BYTES * i);
		
		// we are setting the contents of the address 
		// to be a ptr to a page_track_struct
		// thus, we must do *(page_track_arr + offset)
		// alternatively you can do page_track_arr[i] = page_track_ptr;
		// note you can do the offset here, but can't do it in free_page_track_arr...
		// be consistent, and use `i` and do it this way.
		*(page_track_arr + i) = page_track_ptr;		
	}
	return page_track_arr;

}


void free_page_track_arr(struct page_track** track_arr) {
	/**
	 * free page_track_arr;
	 */
	for (int i = 0; i < NUM_PAGES; i++) {
		// free each individual page_track struct
		//printf("freeing page track arr index: %d", i);
		//printf("\n");

		// seems like you cannot do *(track_arr + offset) (for track = deref addr)
		// without causing
		// a segfault, yet you can do in the allocation method above
		// *(page_track_arr + offset). Why?
		// keep consistent and use `i`.
		struct page_track* track = *(track_arr + i);
		free(track);
	}
	free(track_arr);
	

}


// this is a simple method to check if all pages are taken...
// we will need to make robust
bool check_if_free(struct page_track** page_arr) {
	for (int i = 0; i < NUM_PAGES; i++) {
		struct page_track* page_track_ptr = *(page_arr + i);
		if (!(page_track_ptr->dirty_bit_)) {
			return true;
		}
	}
	return false;
}