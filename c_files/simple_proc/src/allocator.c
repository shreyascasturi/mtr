#include "../include/allocator.h"

struct mem_mgr* create_mmgr() {
    int page_size_bytes = PAGE_SIZE_BYTE;
    int32_t num_pages = NUM_PAGES;

    struct mem_mgr* mmgr_ptr_;
    // allocate mmgr_ptr.
    // if null, fail out. else allocate rest
    mmgr_ptr_ = malloc(sizeof(struct mem_mgr));
    if (mmgr_ptr_ == NULL) {
        exit(1)
    } else {
        int8_t* mem_arr = malloc(sizeof(int8_t) * MAX_MEMORY_BYTES);
        if (mem_arr == NULL) {
            free(mmgr_ptr_);
            exit(1)
        }
        mmgr_ptr_->arr_ = mem_arr;
        mmgr_ptr_->num_free_pgs_ = num_pages;
        mmgr_ptr_->num_bytes_ = MAX_MEMORY_BYTES;
        mmgr_ptr_->num_pages_ = num_pages;
    }
    return mmgr_ptr_;
}

void* allocate(struct mem_mgr* mmgr, int64_t bytes) {
    return NULL;
}

void free(struct proc* proc_ptr) {



    
}

void destroy_mmgr() {
    // to be filled in
}

bool check_page_free() {
    return true;
}