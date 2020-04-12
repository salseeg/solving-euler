const isPrime = (x) => {
	if (x < 2) {
		return false;
	}
	let divisor = 2|0;
	while (divisor * divisor <= x) {
		if (!(x % divisor)) {
			return false;
		}
		divisor += 1;
	}

	return true;
};

const countPrimes = (n) => {
	let x = 2|0;
	for(;n; x += 1) {
		if (isPrime(x)) {
			n -= 1;
		}
	}

	return x-1;
};

const getPrime = (n) => countPrimes(n|0);

const myArgs = process.argv.slice(2);
const [n] = myArgs;
const startTime = Date.now() / 1000;
prime = getPrime(n);
const endTime = Date.now() / 1000;
console.log('Prime: ', prime);
console.log('Time:', endTime - startTime);
