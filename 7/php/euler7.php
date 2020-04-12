<?php

function isPrime (int $x): bool
{
    if ($x < 2) {
        return false;
    }

    $divisor = 2;
	while ($divisor * $divisor <= $x) {
        if (!($x % $divisor)) {
            return false;
        }
        $divisor += 1;
    }

	return true;
}

function countPrimes (int $n)
{
    $x = 2;
	for(;$n; $x += 1) {
        if (isPrime($x)) {
            $n -= 1;
        }
    }

	return $x-1;
}

function bench(callable $fn): array
{
    $startTime = microtime(true);
    $res = $fn();
    $endTime = microtime(true);

    return [$endTime - $startTime, $res];
}

$n = $_SERVER['argv'][1];

[$spent, $prime] = bench(function () use ($n){
    return countPrimes($n);
});

print "Prime: $prime\n";
print "Time: $spent\n";
