#!/usr/bin/python

import sys
import time


def run(d):
    return 3 if d == 1 else run_l(d - 1) + run_a(d - 1) + run(d - 1)


def run_a(d):
    return 3 if d == 1 else run_l(d - 1) + run_aa(d - 1) + run(d - 1)


def run_aa(d):
    return 2 if d == 1 else run_l(d - 1) + run(d - 1)


def run_l(d):
    return 2 if d == 1 else run_l(d - 1) + run_la(d - 1)


def run_la(d):
    return 2 if d == 1 else run_l(d - 1) + run_laa(d - 1)


def run_laa(d):
    return 1 if d == 1 else run_l(d - 1)


def main(days):
    return run(days)


if __name__ == "__main__":
    n = int(sys.argv[1])
    start = time.time()
    x = main(n)
    end = time.time()

    print(n, " Result = ", x)
    print(end - start)
