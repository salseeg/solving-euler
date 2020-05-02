defmodule Prize.ConcurrentMessageNoSwitch do
  def count_prize(n) do
    initalCount = Enum.count Process.list()
    me = self()
    listener = spawn fn -> listenResStart(me, 0, initalCount + 1) end
    spawn fn -> run(0, 0, n, listener) end
    prize = receive do
      count -> count
    end
    IO.inspect(Enum.count(Process.list()), label: "done count")
    prize
  end

  def listenResStart(mainPid, sum, procCount) do
    receive do
      x -> listenRes mainPid, sum + x, procCount
    end
  end

  def listenRes(mainPid, sum, procCount) do
    receive do
      x -> listenRes mainPid, sum + x, procCount
    after
      10 ->
        if Enum.count(Process.list()) <= procCount do
          send mainPid, sum
        else
          listenRes mainPid, sum, procCount
        end
    end
  end

#  def run(_, _, n, pid), do:  send pid, {:done, n}

  def run(_lateCount,  absentCount, _daysToGo, _pid) when absentCount > 2,  do: :ok
  def run( lateCount, _absentCount, _daysToGo, _pid) when lateCount > 1,    do: :ok
  def run(_lateCount, _absentCount,  daysToGo,  pid) when daysToGo == 0,    do: send pid, 1
  def run( lateCount,  absentCount,  daysToGo,  pid) when daysToGo == 15 do
    send pid, Prize.FastNoSwitchTail.run(lateCount, absentCount, daysToGo, 0)
  end
  def run( lateCount,  absentCount,  daysToGo, pid) do
    spawn fn -> run(lateCount + 1, 0, daysToGo - 1, pid) end
    spawn fn -> run(lateCount, 0, daysToGo - 1, pid) end
    spawn fn -> run(lateCount, absentCount + 1, daysToGo - 1, pid) end
  end


end