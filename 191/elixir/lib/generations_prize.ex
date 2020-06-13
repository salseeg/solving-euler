defmodule Prize.Generations do
  def count_prize(n) do
    live [:o], n
  end

  def live(list,    0), do: length(list)
  def live(list, days) when length(list) > 10000 do
    list
    |> Enum.chunk_every(10)
    |> Enum.map(fn chunk -> live chunk, days  end)
    |> Enum.reduce(&+/2)
  end
  def live(list, days) do
    list
    |> Enum.flat_map(&morph/1)
    |> live(days - 1)
  end

  def morph(:o), do: [:O, :o, :a]
  def morph(:O), do: [:O, :A]
  def morph(:a), do: [:O, :o, :b]
  def morph(:A), do: [:O, :B]
  def morph(:b), do: [:O, :o]
  def morph(:B), do: [:O]






#o
  def run(   1, base), do: 3 + base
  def run(days, base), do: runL(days - 1, run(days - 1, runA(days - 1, base)))
#O
  def runL(   1, base), do: 2 + base
  def runL(days, base), do: runL(days - 1, runLA(days - 1, base))

#a
  def runA(   1, base), do: 3 + base
  def runA(days, base), do: runL(days - 1, run(days - 1, runAA(days - 1, base)))
#A
  def runLA(   1, base), do: 2 + base
  def runLA(days, base), do: runL(days - 1, runLAA(days - 1, base))
#b
  def runAA(   1, base), do: 2 + base
  def runAA(days, base), do: runL(days - 1, run(days - 1,  base))
#B
  def runLAA(   1, base), do: 1 + base
  def runLAA(days, base), do: runL(days - 1, base)

end