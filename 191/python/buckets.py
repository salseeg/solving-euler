#!/usr/bin/python

import sys
import time


def run(d):
    buckets = [1, 0, 0, 0, 0, 0]
    for i in range(d):
        o, l, a, la, aa, laa = buckets
        buckets = [
            o + a + aa,
            o + l + a + la + aa + laa,
            o,
            l,
            a,
            la
        ]
    return sum(buckets)

def main(days):
    return run(days)


if __name__ == "__main__":
    n = int(sys.argv[1])
    start = time.time()
    x = main(n)
    end = time.time()

    print(n, " Result = ", x)
    print(end - start)
