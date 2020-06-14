defmodule Prize.BucketsOptimized do
  def count_prize(n) do
    live([1, 0, 0, 0, 0, 0], n)
  end

  def live([o, l, a, la, aa, laa],    0), do: (o + l + a + la + aa + laa)
  def live([o, l, a, la, aa, laa], days), do: live(
    [o + a + aa,
    o + l + a + la + aa + laa,
    o,
    l,
    a,
    la],
    days-1
  )

end