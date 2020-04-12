
object PrimeF64 {
  def isPrime(x: Long, divisor: Long): Boolean = (x, divisor) match {
    case (x, _) if x < 2 => false
    case (x, d) if d * d > x => true
    case (_, d) if d < 2 => true
    case (x, d) if x % d > 0 => isPrime(x, d + 1)
    case (_, _) => false
  }

  def countPrimes(x: Long, n: Long): Long = (x, n) match {
    case (x, 0) => x - 1
    case (x, n) => {
      isPrime(x, 2) match {
        case true => countPrimes(x + 1, n - 1)
        case _ => countPrimes(x + 1, n)
      }
    }
  }

  def main(args: Array[String]): Unit = {
    val n: Long = args(0).toLong
    val start = System.currentTimeMillis()
    val prime: Long = countPrimes(2, n)
    val time = System.currentTimeMillis() - start

    println(n + " prime = " + prime)
    println(time / 1000.0)
  }
}