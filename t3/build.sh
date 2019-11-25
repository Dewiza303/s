#!/bin/bash

cc -m32 -std=c99 -c main.c
nasm -f elf32 leavelastndig.s
cc -m32 -g -o leavelastndig main.o leavelastndig.o
