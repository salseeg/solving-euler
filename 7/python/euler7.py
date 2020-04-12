#!/usr/bin/python

import sys
import time


def isPrime(x) :
    divisor = 2

    if x < 2 :
        return False;

    while divisor * divisor <= x :
        if x % divisor == 0 :
            return False;
        divisor += 1;

    return True;

def countPrimes (n) :
    x = 2
    while n :
        if isPrime(x) :
            n -= 1;
        x += 1

    return x - 1



if __name__ == "__main__":
    n = int(sys.argv[1])
    start = time.time()
    x = countPrimes(n)
    end = time.time()

    print (n," prime = ", x)
    print (end - start)
