defmodule Prize.Buckets do
  def count_prize(n) do
    live({1,0,0,0,0,0}, n)
  end

  def live({o, l, a, la, aa, laa},    0), do: (o + l + a + la + aa + laa)
  def live({o, l, a, la, aa, laa}, days) do
    {0,0,0,0,0,0}
    |> addO(o)
    |> addL(l)
    |> addA(a)
    |> addLA(la)
    |> addAA(aa)
    |> addLAA(laa)
    |> live(days-1)
  end

  def addO({o, l, a, la, aa, laa}, x), do:  {o+x, l+x, a+x, la, aa, laa}
  def addL({o, l, a, la, aa, laa}, x), do:  {o, l+x, a, la+x, aa, laa}
  def addA({o, l, a, la, aa, laa}, x), do:  {o+x, l+x, a, la, aa+x, laa}
  def addLA({o, l, a, la, aa, laa}, x), do:  {o, l+x, a, la, aa, laa+x}
  def addAA({o, l, a, la, aa, laa}, x), do:  {o+x, l+x, a, la, aa, laa}
  def addLAA({o, l, a, la, aa, laa}, x), do:  {o, l+x, a, la, aa, laa}






#o
#  def run(   1, base), do: 3 + base
#  def run(days, base), do: runL(days - 1, run(days - 1, runA(days - 1, base)))
#O
#  def runL(   1, base), do: 2 + base
#  def runL(days, base), do: runL(days - 1, runLA(days - 1, base))
#
#a
#  def runA(   1, base), do: 3 + base
#  def runA(days, base), do: runL(days - 1, run(days - 1, runAA(days - 1, base)))
#A
#  def runLA(   1, base), do: 2 + base
#  def runLA(days, base), do: runL(days - 1, runLAA(days - 1, base))
#b
#  def runAA(   1, base), do: 2 + base
#  def runAA(days, base), do: runL(days - 1, run(days - 1,  base))
#B
#  def runLAA(   1, base), do: 1 + base
#  def runLAA(days, base), do: runL(days - 1, base)

end