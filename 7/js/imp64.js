const isPrime = (x) => {
	if (x < 2) {
		return false;
	}
	let divisor = BigInt(2);
	while (divisor * divisor <= x) {
		if (!(x % divisor)) {
			return false;
		}
		divisor ++;
	}

	return true;
};

const countPrimes = (n) => {
	let x = BigInt(2);
	for(;n; x ++) {
		if (isPrime(x)) {
			n--;
		}
	}

	return x - BigInt(1) ;
};

const getPrime = (n) => countPrimes(BigInt(n));

const myArgs = process.argv.slice(2);
const [n] = myArgs;
const startTime = Date.now() / 1000;
prime = getPrime(BigInt(n));
const endTime = Date.now() / 1000;
console.log('Prime: ', prime);
console.log('Time:', endTime - startTime);
