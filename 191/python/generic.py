#!/usr/bin/python

import sys
import time


def run(late, absent, days):
    if absent > 2 or late > 1:
        return 0

    if days == 0:
        return 1

    return run(late + 1, 0, days - 1) \
        + run(late, 0, days - 1) \
        + run(late, absent + 1, days - 1)


def main(days):
    return run(0, 0, days)


if __name__ == "__main__":
    n = int(sys.argv[1])
    start = time.time()
    x = main(n)
    end = time.time()

    print(n, " Result = ", x)
    print(end - start)
