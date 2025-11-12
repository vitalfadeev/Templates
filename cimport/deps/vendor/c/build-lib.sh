#!/bin/sh
gcc -c external_function.c
ar rc ../lib/libexternal_lib.a external_function.o  