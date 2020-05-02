defmodule Prize.FastNoSwitch do
  def count_prize(n) do
    run 0, 0, n
  end

  def run(_lateCount,  absentCount, _daysToGo) when absentCount > 2,  do: 0
  def run( lateCount, _absentCount, _daysToGo) when lateCount > 1,    do: 0
  def run(_lateCount, _absentCount,  daysToGo) when daysToGo == 0,    do: 1
  def run( lateCount, absentCount, daysToGo) do
    run(lateCount + 1, 0, daysToGo - 1) +
      run(lateCount, 0, daysToGo - 1) +
      run(lateCount, absentCount + 1, daysToGo - 1)
  end

end