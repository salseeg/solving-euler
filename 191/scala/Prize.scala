object Prize {
  def count (n: Long): Long = run(0, 0, n.toInt, 0)

  def run(late: Int, absent: Int, daysToGo: Int, base: Long): Long = (late, absent, daysToGo, base) match {
    case (_, 3, _, b) => b
    case (2, _, _, b) => b
    case (_, _, 0, b) => b + 1
    case (l, a, d, b) =>
      run(l+1, 0, d-1,
        run(l, 0, d-1,
          run(l, a+1, d-1, b)))
  }
}