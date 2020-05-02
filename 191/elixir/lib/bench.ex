defmodule Bench do
  @moduledoc false

  def main(args) do
    options = [switches: [file: :string],aliases: [f: :file]]
    {_opts, arg,_}= OptionParser.parse(args, options)
    #    IO.inspect opts, label: "Command Line Options"
    #    IO.inspect arg, label: "Command Line Arguments"

    {n, ""} = Integer.parse hd(arg)

    mark n
  end

  def mark(n) do
    start = DateTime.utc_now
#    prime = Prize.FastNoSwitchTail.count_prize n
    prime = Prize.ConcurrentMessageNoSwitch.count_prize n
    finish = DateTime.utc_now
    IO.inspect prime, label: "Prize count"
    IO.inspect DateTime.diff(finish, start, :millisecond) / 1_000, label: "took s"
  end


end
