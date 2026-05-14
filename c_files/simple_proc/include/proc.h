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
#endif
