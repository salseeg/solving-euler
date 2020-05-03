object Bench {
  def main(args: Array[String]): Unit = {
    val n: Long = args(0).toLong

    val start = System.currentTimeMillis()
    val res: Long = PrizeNoCounterNoTail.count(n)
    val time = System.currentTimeMillis() - start

    println(s"$n result = $res")
    println(time / 1000.0)
  }
}