-module(fib).

-export([main/1, fib/1]).

main([Arg| _]) ->
  _ = rand:uniform(),
  {Nth, _} = string:to_integer(Arg),
  io:format("~p~n", [fib(Nth)]),
  erlang:halt().

fib(0) -> 0;
fib(1) -> 1;
fib(N) -> fib(fib(1), fib(2), N - 2).

fib(A, B, 0) -> A + B;
fib(A, B, Rest) -> fib(B, A + B, Rest - 1).



