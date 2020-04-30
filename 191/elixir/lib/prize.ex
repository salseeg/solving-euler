defmodule Prize do
  @moduledoc """
  Documentation for `Prize`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Prize.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  A particular school offers cash rewards to children with good attendance and punctuality.
  If they are absent for three consecutive days or late on more than one occasion then they forfeit their prize.

  During an n-day period a trinary string is formed for each child consisting of L's (late), O's (on time), and A's (absent).

  Although there are eighty-one trinary strings for a 4-day period that can be formed, exactly forty-three strings would lead to a prize:

  OOOO OOOA OOOL OOAO OOAA OOAL OOLO OOLA OAOO OAOA
  OAOL OAAO OAAL OALO OALA OLOO OLOA OLAO OLAA AOOO
  AOOA AOOL AOAO AOAA AOAL AOLO AOLA AAOO AAOA AAOL
  AALO AALA ALOO ALOA ALAO ALAA LOOO LOOA LOAO LOAA
  LAOO LAOA LAAO

  How many "prize" strings exist over a 30-day period?
  """

  def count_prize(n) do
    run 0, 0, n, ''
  end

  def run(_lateCount,  absentCount, _daysToGo, _path) when absentCount > 2,  do: 0
  def run( lateCount, _absentCount, _daysToGo, _path) when lateCount > 1,    do: 0
  def run(_lateCount, _absentCount,  daysToGo, _path) when daysToGo == 0,    do: 1
  def run(lateCount, absentCount, daysToGo, path) do
    check(:late, lateCount, absentCount, daysToGo, path) +
    check(:onTime, lateCount, absentCount, daysToGo, path) +
    check(:absent, lateCount, absentCount, daysToGo, path)
  end


  def check( today,  lateCount,  absentCount,  daysToGo, path) when today == :absent,   do: run lateCount, absentCount + 1, daysToGo - 1, path ++ 'A'
  def check( today,  lateCount, _absentCount,  daysToGo, path) when today == :late,     do: run lateCount + 1, 0, daysToGo - 1, path ++ 'L'
  def check( today,  lateCount, _absentCount,  daysToGo, path) when today == :onTime,   do: run lateCount, 0, daysToGo - 1, path ++ 'O'

end
