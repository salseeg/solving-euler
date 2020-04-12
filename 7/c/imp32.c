#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int is_prime(unsigned int x)
{
	unsigned int divisor = 2;

	if (x < 2) {
		return 0;
	}
	while (divisor * divisor <= x) {
		if (x % divisor == 0) {
			return 0;
		}
		divisor += 1;
	}

	return 1;
}

unsigned int count_primes(unsigned int n)
{
	unsigned int x = 2;
	while (n) {
		if (is_prime(x)) {
			n -= 1;
		}
		x += 1;
	}

	return x - 1;
}

int main(int argc, char ** argv) 
{

     
     	clock_t start, end;
     	double cpu_time_used;
	unsigned int n = 0;
	unsigned int prime = 0;

	if (argc < 2) {
		printf("I need a number\n");
		return -1;
	}

	n = atoi(argv[1]);

     	start = clock();
	prime = count_primes(n);
     	end = clock();
     	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;

	printf("%d prime = %d\n", n, prime);
	printf("time = %f\n", cpu_time_used);

	return 0;
}

