#!/bin/bash

cc -m32 -std=c99 -c main.c
nasm -f elf32 remnth.s
cc -m32 -g -o remnth main.o remnth.o

