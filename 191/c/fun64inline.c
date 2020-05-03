#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

typedef unsigned long long result;
typedef unsigned char counter;

result runL(counter days);
result runLA(counter days);
result runLAA(counter days);
result runA(counter days);
result runAA(counter days);

result run(counter days)
{
    if (days == 1) return 3;
    return runL(days-1) + run(days-1) + runA(days-1);
}

result runL(counter days)
{
    if (days == 1) return 2;
    return runL(days-1) + runLA(days-1);
}

result runA(counter days)
{
    if (days == 1) return 3;
    return runL(days-1) + run(days-1) + runAA(days-1);
}

result runLA(counter days)
{
    if (days == 1) return 2;
    return runL(days-1) + runLAA(days-1);
}

result runAA(counter days)
{
    if (days == 1) return 2;
    return runL(days-1) + run(days-1);
}

result runLAA(counter days)
{
    if (days == 1) return 1;
    return runL(days-1);
}

result countPrize(counter daysToGo)
{
    return run(daysToGo);
}

int main(int argc, char ** argv)
{
	counter n = 0;
	result prize = 0;

    clock_t start, end;
    double cpu_time_used;

	if (argc < 2) {
		printf("I need a number\n");
		return -1;
	}

	n = atoi(argv[1]);

    start = clock();
	prize = countPrize(n);
    end = clock();
    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;

	printf("%d prize = %llu\n", n, prize);
	printf("time = %f\n", cpu_time_used);

	return 0;
}

