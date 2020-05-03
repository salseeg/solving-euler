defmodule Prize.FastNoSwitchTailNoCounterShortCall do
  def count_prize(n) do
    run n, 0
  end

  def run(   1, base), do: 3 + base
  def run(days, base), do: runL(days - 1, run(days - 1, runA(days - 1, base)))

  def runL(   1, base), do: 2 + base
  def runL(days, base), do: runL(days - 1, runLA(days - 1, base))

  def runA(   1, base), do: 3 + base
  def runA(days, base), do: runL(days - 1, run(days - 1, runAA(days - 1, base)))

  def runLA(   1, base), do: 2 + base
  def runLA(days, base), do: runL(days - 1, runLAA(days - 1, base))

  def runAA(   1, base), do: 2 + base
  def runAA(days, base), do: runL(days - 1, run(days - 1,  base))

  def runLAA(   1, base), do: 1 + base
  def runLAA(days, base), do: runL(days - 1, base)

end