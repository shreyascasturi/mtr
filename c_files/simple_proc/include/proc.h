#ifndef PROC_H
#define PROC_H
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
struct proc {
	int64_t* uuid_;
	char* name_;
	int64_t* duration_;
	int8_t* memptr_;
};

// create the proc struct ptr given a name and duration
// NOTE: we will not give memory here, we will set to NULL.
// only upon calling ask_page in allocer.h will we set this
// struct proc ptrs int8_t memptr_ argument
struct proc* create_proc(char* name, int64_t duration);

#endif
