#!/bin/bash

cc -m32 -std=c99 -c main.c
nasm -f elf32 capwords.s
cc -m32 -g -o capwords main.o capwords.o
