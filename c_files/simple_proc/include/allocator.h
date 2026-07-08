#ifndef ALLOCATOR_H
#define ALLOCATOR_H

#include <stdlib.h>
#include <stdbool.h>
#include "proc.h"
#include "constants.h"

// struct page_track {
// 	int8_t* memptr_;
// 	struct proc* proc_ptr_;
// 	//int64_t* duration_;
// 	bool dirty_bit_;
// };

// // given a starting address
// // create an array of page track ptrs
// struct page_track** create_track_arr(int8_t* starting_addr);

// // check if page_array has any free pages (check if page_track structs
// // are all marked unfree). Return true if any are free, else false.
// bool check_if_free(struct page_track** page_arr);

// // given a track array, free the array and all individual pointers.
// void free_page_track_arr(struct page_track** track_arr);

// mem_mgr
// contains the int8_t arr (the byte array)
// number of free pgs
struct mem_mgr {
    // array itself 
    int8_t* arr_;

    // number of free pages
    int32_t num_free_pgs_;
    
    // total number of bytes
    int32_t num_bytes_;
    
    // total number of pages
    int32_t num_pages_;
};

// struct mmgr {

//     int8_t* marr_; // memory array
//     int32_t num_free_pgs_;
//     int32_t pg_size_bytes_;
//     struct page_track** page_track_arr_; // page_track array
// };
struct mem_mgr* create_mmgr();

void* allocate(struct mem_mgr* mmgr, int64_t bytes);

void free(struct proc* proc_ptr);

void destroy_mmgr();

bool check_page_free();

#endif 