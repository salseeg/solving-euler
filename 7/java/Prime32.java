public class Prime32 {

    public static boolean isPrime(int x)
    {
        int divisor = 2;

        if (x < 2) {
            return false;
        }

        while (divisor * divisor <= x) {
            if (x % divisor == 0) {
                return false;
            }
            divisor += 1;
        }

        return true;
    }

    public static int getPrime(int n)
    {
        int x = 2;

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
        Integer n = Integer.valueOf(args[0]);
        int prime;

        long start = System.nanoTime();
        prime = getPrime((int) n);
        long end = System.nanoTime();
        long microseconds = (end - start) / 1000;

        Integer primeI = prime;

        System.out.println(n.toString().concat(" prime = ").concat(primeI.toString()));
        System.out.println(microseconds / 1000000.0);
    }
}