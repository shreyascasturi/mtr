#!/bin/bash

# apparently with cmake this wasn't working...
# we do need the literal command like this
gcc -fopenmp test.c -o test
