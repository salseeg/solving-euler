import java.math.BigInteger;

public class PrimeArb {

    public static Boolean isPrime(BigInteger x)
    {
        BigInteger divisor = BigInteger.valueOf(2);

        if (x.longValue() < 2) {
            return false;
        }

        while (divisor.multiply(divisor).compareTo(x) <= 1) {
            if (x.mod(divisor).longValue() == 0) {
                return false;
            }
            divisor.add(1;
        }

        return true;
    }

    public static BigInteger getPrime(BigInteger n)
    {
        BigInteger x = 2;

        while (n > 0) {
            if (isPrime(x)) {
                n -= 1;
            }

            x += 1;
        }

        return x - 1;
    }

    public static void main (String[] args)
    {
        BigInteger n = BigInteger.valueOf((int) Integer.valueOf(args[0]));
        BigInteger prime;

        long start = System.nanoTime();
        prime = getPrime(n);
        long end = System.nanoTime();
        long microseconds = (end - start) / 1000;

        System.out.println(n.toString().concat(" prime = ").concat(prime.toString()));
        System.out.println(microseconds / 1000000.0);
    }
}