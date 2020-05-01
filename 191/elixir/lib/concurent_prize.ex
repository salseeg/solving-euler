defmodule Prize.Concurrent do
  def count_prize(n) do
    run 0, 0, n
  end

  def run(_lateCount,  absentCount, _daysToGo) when absentCount > 2,  do: 0
  def run( lateCount, _absentCount, _daysToGo) when lateCount > 1,    do: 0
  def run(_lateCount, _absentCount,  daysToGo) when daysToGo == 0,    do: 1
  def run(lateCount, absentCount, daysToGo)
      when daysToGo > 17
           and rem(daysToGo, 2) == 0
  do
    absent  = Task.async(Prize.Concurrent, :check, [:absent, lateCount, absentCount, daysToGo])
    late    = Task.async(Prize.Concurrent, :check, [:late,   lateCount, absentCount, daysToGo])
    onTime  = Task.async(Prize.Concurrent, :check, [:onTime, lateCount, absentCount, daysToGo])
    Task.await(absent, :infinity) + Task.await(late, :infinity) + Task.await(onTime, :infinity)
  end
  def run(lateCount, absentCount, daysToGo) do
    check(:late, lateCount, absentCount, daysToGo) +
      check(:onTime, lateCount, absentCount, daysToGo) +
      check(:absent, lateCount, absentCount, daysToGo)
  end


  def check( today,  lateCount, _absentCount,  daysToGo) when today == :onTime,   do: run lateCount, 0, daysToGo - 1
  def check( today,  lateCount, _absentCount,  daysToGo) when today == :late,     do: run lateCount + 1, 0, daysToGo - 1
  def check(_today,  lateCount,  absentCount,  daysToGo),                         do: run lateCount, absentCount + 1, daysToGo - 1

end