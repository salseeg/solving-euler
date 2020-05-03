.PHONY: all check run

all: check run

check: fun64inline
	./fun64inline 20

run: fun64inline
	./fun64inline 30

fun32: fun32.c
	gcc -O3 fun32.c -o fun32

fun64: fun64.c
	gcc -O3 fun64.c -o fun64

fun64inline: fun64inline.c
	gcc -O3 -std=c11 fun64inline.c -o fun64inline


