-module(euler7_float).

-export([main/1]).

main([Arg| _]) ->
    {N, _} = string:to_float(Arg),
    io:format("~f~n", [N]),
    StartTime = erlang:timestamp(),
    Prime = get_prime(N),
    EndTime = erlang:timestamp(),
    io:format("~f prime : ~f~n", [N, Prime]),
    io:format("Time : ~f~n", [timer:now_diff(EndTime, StartTime)/1000000]),
    erlang:halt(0).

get_prime(N) -> count_primes(2.0, N).

count_primes(X, N) when N < 0.5 -> X - 1.0;
count_primes(X, N) -> count_primes(X + 1.0, decIf(N, is_prime(X, 2.0))).

decIf(N, P) when P  -> N - 1.0;
decIf(N, _)         -> N.

%%is_prime(_, _) -> true.
is_prime( X, _Div) when X < 1.9           -> false;
is_prime( X,  Div) when Div * Div > X   -> true;
is_prime(_X,  Div) when Div < 1.9         -> true;
is_prime( X,  Div)                        -> get_next_prime(X, Div, X/Div - math:floor(X/Div) < 1.0e-8).
%%is_prime( X,  Div) when X rem Div < 0.1  -> false;
%%is_prime( X,  Div)                      -> is_prime(X, Div + 1.0).

get_next_prime(_,   _, P) when P  -> false;
get_next_prime(X, Div, _)         ->
%%  io:format("~f ~f ~n", [X, Div]),
  is_prime(X, Div + 1.0).
