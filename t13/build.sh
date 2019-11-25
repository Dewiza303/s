#!/bin/bash

cc -m32 -std=c99 -c main.c
nasm -f elf32 replnum.s
cc -m32 -g -o replnum main.o replnum.o
