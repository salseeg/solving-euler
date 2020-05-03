object PrizeNoCounterNoTail {
  def count (n: Long): Long = run(n.toInt)

  def run(days: Long): Long = days match {
    case 0 => 1
    case d => runL(d-1) + run(d-1) + runA(d-1)
  }

  def runL(days: Long): Long = days match {
    case 0 => 1
    case d => runL(d-1) + runLA(d-1)
  }

  def runA(days: Long): Long = days match {
    case 0 => 1
    case d => runL(d-1) + run(d-1) + runAA(d-1)
  }

  def runLA(days: Long): Long = days match {
    case 0 => 1
    case d => runL(d-1) + runLAA(d-1)
  }

  def runAA(days: Long): Long = days match {
    case 0 => 1
    case d => runL(d-1) + run(d-1)
  }

  def runLAA(days: Long): Long = days match {
    case 0 => 1
    case d => runL(d-1)
  }
}
