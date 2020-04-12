
object PrimeI64 {
  def isPrime(x: Long): Boolean = {
    var divisor: Long = 2

    if (x < 2) {
      return false
    }

    while (divisor * divisor <= x) {
      if (x % divisor == 0) {
        return false;
      }
      divisor += 1;
    }

    return true;
  }

  def countPrimes(number: Long): Long = {
    var x: Long = 2
    var n: Long = number

    while (n > 0) {
      if (isPrime(x)) {
        n -= 1
      }
      x += 1
    }

    return x - 1
  }

  def main(args: Array[String]): Unit = {
    val n: Long = args(0).toLong
    val start = System.currentTimeMillis()
    val prime: Long = countPrimes(n)
    val time = System.currentTimeMillis() - start

    println(n + " prime = " + prime)
    println(time / 1000.0)
  }
}