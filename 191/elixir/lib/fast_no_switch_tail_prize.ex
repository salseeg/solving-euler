defmodule Prize.FastNoSwitchTail do
  def count_prize(n) do
    run 0, 0, n, 0
  end

  def run(_lateCount,  absentCount, _daysToGo, base) when absentCount > 2,  do: base
  def run( lateCount, _absentCount, _daysToGo, base) when lateCount > 1,    do: base
  def run(_lateCount, _absentCount,  daysToGo, base) when daysToGo == 0,    do: base + 1
  def run( lateCount, absentCount, daysToGo, base) do
    run(lateCount + 1, 0, daysToGo - 1,
      run(lateCount, 0, daysToGo - 1,
        run(lateCount, absentCount + 1, daysToGo - 1, base)
      )
    )
  end

end