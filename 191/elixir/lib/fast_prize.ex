defmodule Prize.Fast do
  def count_prize(n) do
    run 0, 0, n
  end

  def run(_lateCount,  absentCount, _daysToGo) when absentCount > 2,  do: 0
  def run( lateCount, _absentCount, _daysToGo) when lateCount > 1,    do: 0
  def run(_lateCount, _absentCount,  daysToGo) when daysToGo == 0,    do: 1
  def run( lateCount, absentCount, daysToGo) do
    check(:late, lateCount, absentCount, daysToGo) +
      check(:onTime, lateCount, absentCount, daysToGo) +
      check(:absent, lateCount, absentCount, daysToGo)
  end


  def check( today,  lateCount, _absentCount,  daysToGo) when today == :onTime,   do: run lateCount, 0, daysToGo - 1
  def check( today,  lateCount, _absentCount,  daysToGo) when today == :late,     do: run lateCount + 1, 0, daysToGo - 1
  def check( today,  lateCount,  absentCount,  daysToGo),                         do: run lateCount, absentCount + 1, daysToGo - 1

end