#!/bin/bash

cc -m32 -std=c99 -c main.c
nasm -f elf32 remrep.s
cc -m32 -g -o remrep main.o remrep.o
