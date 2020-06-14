defmodule Prize.BucketsOptimized do
  def count_prize(n) do
    live({1,0,0,0,0,0}, n)
  end

  def live({o, l, a, la, aa, laa},    0), do: (o + l + a + la + aa + laa)
  def live({o, l, a, la, aa, laa}, days) do
    {
      o + a + aa,
      o + l + a + la + aa + laa,
      o,
      l,
      a,
      la
    }
    |> live(days-1)
  end

#  def addO({o, l, a, la, aa, laa}, x), do:  {o+x, l+x, a+x,   la,   aa,   laa}
#  def addL({o, l, a, la, aa, laa}, x), do:  {  o, l+x,   a, la+x,   aa,   laa}
#  def addA({o, l, a, la, aa, laa}, x), do:  {o+x, l+x,   a,   la, aa+x,   laa}
#  def addLA({o, l, a, la, aa, laa}, x), do:  { o, l+x,   a,   la,   aa, laa+x}
#  def addAA({o, l, a, la, aa, laa}, x), do: {o+x, l+x,   a,   la,   aa,   laa}
#  def addLAA({o, l, a, la, aa, laa}, x), do:  {o, l+x,   a,   la,   aa,   laa}


end