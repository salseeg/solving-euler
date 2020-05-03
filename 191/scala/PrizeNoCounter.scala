object PrizeNoCounter {
  def count (n: Long): Long = run(n.toInt, 0)

  def run(days: Long, base: Long): Long = (days, base) match {
    case (0, b) => b + 1
    case (d, b) => runL(d-1, run(d-1, runA(d-1, b)))
  }

  def runL(days: Long, base: Long): Long = (days, base) match {
    case (0, b) => b + 1
    case (d, b) => runL(d-1, runLA(d-1, b))
  }

  def runA(days: Long, base: Long): Long = (days, base) match {
    case (0, b) => b + 1
    case (d, b) => runL(d-1, run(d-1, runAA(d-1, b)))
  }

  def runLA(days: Long, base: Long): Long = (days, base) match {
    case (0, b) => b + 1
    case (d, b) => runL(d-1, runLAA(d-1, b))
  }

  def runAA(days: Long, base: Long): Long = (days, base) match {
    case (0, b) => b + 1
    case (d, b) => runL(d-1, run(d-1, b))
  }

  def runLAA(days: Long, base: Long): Long = (days, base) match {
    case (0, b) => b + 1
    case (d, b) => runL(d-1, b)
  }
}
