#include <stdio.h>
#include <stdlib.h>
#include "../include/proc.h"
#include "../include/alloc_struct.h"
#include "../include/constants.h"


int main() {
	// time stats
	int time_elapsed = 0;
	
	// malloc a single memory block
	// it will be subdivided into 
	int8_t* mem = malloc(sizeof(int8_t) * MAX_MEMORY_BYTES);
	if (mem == NULL) {
		printf("total mem failure\n");
		exit(1);
	}
	print("created mem array, creating track arr\n");

	struct page_track** track_arr = create_track_arr(mem);
	print("created track_arr array\n");
	
	printf("freeing memory\n");
	free(mem);
	printf("freed memory\n");

	printf("freeing page track arr");
	free_page_track_arr(track_arr);
	printf("freed page_track_arr, exiting");
}
