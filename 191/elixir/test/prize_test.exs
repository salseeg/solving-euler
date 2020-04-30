defmodule PrizeTest do
  use ExUnit.Case
  doctest Prize

  test "greets the world" do
    assert Prize.hello() == :world
  end

  test "correct count" do
    assert Prize.count_prize(1) == 3
    assert Prize.count_prize(2) == 8
    assert Prize.count_prize(3) == 19
    assert Prize.count_prize(4) == 43
  end
end
