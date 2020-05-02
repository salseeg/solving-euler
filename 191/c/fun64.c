#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

typedef unsigned long result;
typedef unsigned short int counter;
typedef enum { absent, late, onTime } state;

result run(counter lateCount, counter absentCount, counter daysToGo)
{
    if (absentCount > 2 || lateCount > 1) {
        return 0;
    }

    if (daysToGo == 0) {
        return 1;
    }

    return run(lateCount + 1, 0, daysToGo - 1)
        +  run(lateCount, 0, daysToGo - 1)
        +  run(lateCount, absentCount + 1, daysToGo - 1);
}

result countPrize(counter daysToGo)
{
    return run(0, 0, daysToGo);
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

	printf("%d prize = %d\n", n, prize);
	printf("time = %f\n", cpu_time_used);

	return 0;
}

