#!/bin/bash

cc -m32 -std=c99 -c main.c
nasm -f elf32 reversedig.s
cc -m32 -g -o reversedig main.o reversedig.o
