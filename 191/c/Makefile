.PHONY: all check run

all: check run

check: fun32 fun64
	./fun32 20
	./fun64 20

run: fun32
	./fun64	30
	./fun32 30

fun32: fun32.c
	gcc -O3 fun32.c -o fun32

fun64: fun64.c
	gcc -O3 fun64.c -o fun64



