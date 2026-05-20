#include <stdio.h>
#include <stdlib.h>
#include "../include/proc.h"
#include "../include/alloc_struct.h"
#include "../include/constants.h"

struct proc* create_proc(char* name, int64_t duration) {
	struct proc* new_proc_ptr = malloc(sizeof(struct proc));
	if (new_proc_ptr == NULL) {
		exit(1);
	}
	int64_t* duration_ptr = sizeof(int64_t);
	if (duration_ptr == NULL) {
		exit(1);
	}
	new_proc_ptr->duration_ = duration_ptr;
	*(new_proc_ptr->duration_) = duration;

	new_proc_ptr->memptr_ = NULL;
	new_proc_ptr->uuid_ = NULL;
	return new_proc_ptr;
}

int main() {
	// time stats
	int time_elapsed = 0;
	
	printf("hello world\n");
	// // malloc a single memory block
	// // it will be subdivided into 
	// int8_t* mem = malloc(sizeof(int8_t) * MAX_MEMORY_BYTES);
	// if (mem == NULL) {
	// 	printf("total mem failure\n");
	// 	exit(1);
	// }
	// printf("created mem array, creating track arr\n");

	// struct page_track** track_arr = create_track_arr(mem);
	// printf("created track_arr array\n");
	
	// printf("freeing memory\n");
	// free(mem);
	// printf("freed memory\n");

	// printf("freeing page track arr");
	// free_page_track_arr(track_arr);
	// printf("freed page_track_arr, exiting");
}
