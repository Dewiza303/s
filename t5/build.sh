#!/bin/bash

cc -m32 -std=c99 -c main.c
nasm -f elf32 leavelongestnum.s
cc -m32 -g -o leavelongestnum main.o leavelongestnum.o
