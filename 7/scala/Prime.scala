
object Prime {
//  def isPrime(x: Int, d: Int): Boolean =
//    if (x < 2) false else
//    if (d < 2) true else
//    if (d * d  > x) true else
//    if (x % d > 0) isPrime(x, d + 1) else
//    false

  def isPrime(x: Int, divisor: Int): Boolean = (x, divisor) match {
    case (x, _) if x < 2      => false
    case (_, d) if d < 2      => true
    case (x, d) if d * d > x  => true
    case (x, d) if x % d > 0  => isPrime(x, d + 1)
    case (_, _)               => false
  }

  def countPrimes(x: Int, n: Int): Int = if (n == 0) x - 1  else countPrimes(x + 1, decIfPrime(x, n))

  def decIfPrime(x: Int, n: Int): Int = if (isPrime(x, 2)) n - 1  else n


  def main(args: Array[String]): Unit = {
    val n: Int = args(0).toInt
    val start = System.currentTimeMillis()
    val prime: Int = countPrimes(2, n)
    val time = System.currentTimeMillis() - start

    println(n + " prime = " + prime)
    println(time / 1000.0)
  }
}