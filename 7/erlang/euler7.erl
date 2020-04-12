-module(euler7).

-export([main/1]).

main([Arg| _]) ->
    {N, _} = string:to_integer(Arg),
    StartTime = erlang:timestamp(),
    Prime = get_prime(N),
    EndTime = erlang:timestamp(),
    io:format("~B prime : ~B~n", [N, Prime]),
    io:format("Time : ~f~n", [timer:now_diff(EndTime, StartTime)/1000000]),
    erlang:halt().

get_prime(N) -> count_primes(2, N).

count_primes(X, 0) -> X - 1;
count_primes(X, N) -> count_primes(X + 1, decIf(N, is_prime(X, 2))).

decIf(N, P) when P  -> N - 1;
decIf(N, _)         -> N.

is_prime( X, _Div) when X < 2           -> false;
is_prime(_X,  Div) when Div < 2         -> true;
is_prime(X, Div)                        -> is_prime_optimized(X, Div).


is_prime_optimized( X,  Div) when Div * Div > X   -> true;
is_prime_optimized( X,  Div) when X rem Div == 0  -> false;
is_prime_optimized( X,  Div)                      -> is_prime_optimized(X, Div + 1).
