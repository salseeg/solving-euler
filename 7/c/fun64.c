#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int is_prime(unsigned long int x, unsigned long int divisor)
{
	if (x < 2) {
		return 0;
	}
	if (divisor * divisor > x) {
		return 1;
	}
	if (divisor < 2) {
		return 1;
	}
	if (x % divisor > 0) {
		return is_prime(x, divisor + 1);
	}

	return 0;
}

unsigned long int count_primes(unsigned long int x, unsigned long int n)
{
	if (n == 0) {
		return x -1;
	}
	if (is_prime(x, 2)) {
		return count_primes(x + 1, n - 1);
	}

	return count_primes(x + 1, n);
}

int main(int argc, char ** argv) 
{

     
     	clock_t start, end;
     	double cpu_time_used;
	unsigned long int n = 0;
	unsigned long int prime = 0;

	if (argc < 2) {
		printf("I need a number\n");
		return -1;
	}

	n = atoi(argv[1]);

     	start = clock();
	prime = count_primes(2, n);
     	end = clock();
     	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;

	printf("%d prime = %d\n", n, prime);
	printf("time = %f\n", cpu_time_used);

	return 0;
}

