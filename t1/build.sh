#!/bin/bash

nasm -f elf32 removerng.s
cc -m32 -std=c99 -c main.c
cc -m32 -g -o removerng main.o removerng.o
