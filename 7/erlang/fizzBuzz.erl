-module(fizzBuzz).

%% API
-export([main/1]).


main([Arg| _]) ->
  _ = rand:uniform(),
  {ChildrenAmount, _} = string:to_integer(Arg),
  spawnChildren(10000, ChildrenAmount),
  WonCount = listenChildren(ChildrenAmount),
  io:format("~p%~n", [WonCount/ChildrenAmount * 100]),
  erlang:halt().


map(X) when X rem 3*5 == 0  -> "FizzBuzz";
map(X) when X rem 5 == 0    -> "Buzz";
map(X) when X rem 3 == 0    -> "Fizz";
map(X)                      -> integer_to_list(X).

list(X) when X > 100  -> [];
list(X)               -> map(X) : list(X + 1).
