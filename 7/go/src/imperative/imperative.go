package main

import (
	"fmt"
	"os"
	"strconv"
	"time"
)

func isPrime(x uint32) bool {
	var divisor uint32 = 2

	if x < 2 {
		return false
	}
	for divisor * divisor <= x {
		if x % divisor == 0 {
			return false
		}
		divisor += 1
	}

	return true
}

func countPrimes(n uint32) uint32 {
	var x uint32 = 2
	for n > 0 {
		if isPrime(x) {
			n -= 1
		}
		x += 1
	}

	return x - 1
}


func main () {
	arg := os.Args[1]
	n, err := strconv.Atoi(arg)

	if err != nil {
		fmt.Println("I need a number")
		return
	}

	start := time.Now()
	prime := countPrimes(uint32(n))
	t := time.Now()
	elapsed := t.Sub(start)


	fmt.Println(n, " prime = ", prime);
	fmt.Println(elapsed);
}
