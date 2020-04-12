defmodule Commandline.CLI do
  def main(args) do
    options = [switches: [file: :string],aliases: [f: :file]]
    {opts, arg,_}= OptionParser.parse(args, options)
    IO.inspect opts, label: "Command Line Options"
    IO.inspect arg, label: "Command Line Arguments"

    {n, ""} = Integer.parse hd(arg)

    IO.inspect n, label: "n"
    start = DateTime.utc_now
    prime = getPrime n
    finish = DateTime.utc_now
    IO.inspect prime, label: "Prime"
    IO.inspect DateTime.diff(finish, start, :millisecond) / 1_000, label: "took s"
  end


  def getPrime(n), do: count_primes 2, n

  def decIf(n, p) when p, do: n - 1
  def decIf(n, _),        do: n

  def count_primes(x, 0), do: x - 1
  def count_primes(x, n), do: count_primes(x + 1, decIf(n, is_prime(x)))

  def is_prime( x,  div \\ 2)
  def is_prime( x, _div) when x < 2,            do: false
  def is_prime( x,  div) when div * div > x,    do: true
  def is_prime(_x,  div) when div < 2,          do: true
  def is_prime( x,  div) when rem(x, div) == 0, do: false
  def is_prime( x,  div),                       do: is_prime(x, div + 1)


  def fib(0), do: 1
  def fib(1), do: 2
  def fib(x), do: fib(fib(0), fib(1), x - 2)

  def fib(a, b, 0), do: a + b
  def fib(a, b, x), do: fib(b, a + b, x - 1)


end
