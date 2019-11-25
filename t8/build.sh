#!/bin/bash

cc -m32 -std=c99 -c main.c
nasm -f elf32 getdec.s
cc -m32 -g -o getdec main.o getdec.o
