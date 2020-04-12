
object Prime2 {
  def isPrime(x: Int): Boolean = {
    var divisor: Int = 2

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

  def countPrimes(number: Int): Int = {
    var x: Int = 2
    var n: Int = number

    while (n > 0) {
      if (isPrime(x)) {
        n -= 1
      }
      x += 1
    }

    return x - 1
  }

  def main(args: Array[String]): Unit = {
    val n: Int = args(0).toInt
    val start = System.currentTimeMillis()
    val prime: Int = countPrimes(n)
    val time = System.currentTimeMillis() - start

    println(n + " prime = " + prime)
    println(time / 1000.0)
  }
}