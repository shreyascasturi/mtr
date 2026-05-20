#ifndef ALLOCER_H
#define ALLOCER_H

#include "constants.h"
#include <stdlib.h>
#include <stdbool.h>
#include "alloc_struct.h"

struct mmgr {

    int8_t* marr_; // memory array
    int32_t num_free_pgs_;
    int32_t pg_size_bytes_;
    struct page_track** page_track_arr_; // page_track array
};

// given a mmgr and a proc ptr,
// ask a page for the proc ptr
// if it is possible, then give the ptr, otherwise say no.
// if no, you need to free the struct
int8_t* ask_page(struct mmgr* mmgr, struct proc* proc_ptr);

#endif 