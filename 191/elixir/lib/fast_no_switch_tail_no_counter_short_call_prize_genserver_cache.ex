defmodule Prize.FastNoSwitchTailNoCounterShortCallEtsCache do
  def count_prize(n) do
    :ets.new(:run_cache, [:named_table])
    :ets.new(:l_cache, [:named_table])
    runCached n, 0
  end

  def run(   1, base), do: 3 + base
  def run(days, base), do: runCachedL(days - 1, runCached(days - 1, runA(days - 1, base)))

  def runL(   1, base), do: 2 + base
  def runL(days, base), do: runCachedL(days - 1, runLA(days - 1, base))

  def runA(   1, base), do: 3 + base
  def runA(days, base), do: runCachedL(days - 1, runCached(days - 1, runAA(days - 1, base)))

  def runLA(   1, base), do: 2 + base
  def runLA(days, base), do: runCachedL(days - 1, runLAA(days - 1, base))

  def runAA(   1, base), do: 2 + base
  def runAA(days, base), do: runCachedL(days - 1, runCached(days - 1,  base))

  def runLAA(   1, base), do: 1 + base
  def runLAA(days, base), do: runCachedL(days - 1, base)

  def runCached(days, base), do: runCachedLookup(:ets.lookup(:run_cache, days), days, base)

  defp runCachedLookup([{days, res}], days, base), do: res + base
  defp runCachedLookup([], days, base) do
    res = run days, 0
    :ets.insert(:run_cache, {days, res})
    res + base
  end

  def runCachedL(days, base), do: runLCachedLookup(:ets.lookup(:l_cache, days), days, base)

  defp runLCachedLookup([{days, res}], days, base), do: res + base
  defp runLCachedLookup([], days, base) do
    res = runL days, 0
    :ets.insert(:l_cache, {days, res})
    res + base
  end


end