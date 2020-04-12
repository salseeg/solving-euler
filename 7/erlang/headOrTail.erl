%%%-------------------------------------------------------------------
%%% @author serge
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. гру 2019 22:44
%%%-------------------------------------------------------------------
-module(headOrTail).
-author("serge").

%% API
-export([main/1, children/2]).


main([Arg| _]) ->
  _ = rand:uniform(),
  {ChildrenAmount, _} = string:to_integer(Arg),
  spawnChildren(10000, ChildrenAmount),
  WonCount = listenChildren(ChildrenAmount),
  io:format("~p%~n", [WonCount/ChildrenAmount * 100]),
  erlang:halt().

spawnChildren (_, 0) -> ok;
spawnChildren (N, Count) ->
  spawn(headOrTail, children, [N, self()]),
  spawnChildren(N, Count - 1).

listenChildren(Count) -> listenChildren(Count, {{0, 0}, 0, {0, 0}}).
listenChildren(0, Stats) -> Stats;
listenChildren(Count, Stats) ->
          receive
            Response -> listenChildren(Count - 1, updateStats(Stats, Response))
          end.

updateStats({W, N, F},              {finished, _})    -> {W, N + 1, F};
updateStats({W, N, {Count, Total}}, {fail, _, N})     -> {W, N, {Count + 1, Total + N}};
updateStats({{Count, Total}, N, F}, {win, _, N})      -> {{Count + 1, Total + N}, N, F};
updateStats(Stats, _)                                 -> Stats.


%%            {finished, _}   -> listenChildren(Count - 1, Won, Finished + 1, Fail);
%%            {fail, _, _}    -> listenChildren(Count - 1, Won, Finished, Fail + 1);
%%            {win, _, _}     -> listenChildren(Count - 1, Won + 1, Finished, Fail)
%%
%%   Children
%%
children(N, Parent) ->
  Parent ! run(N, 100, {0.90, -1.0}, {10, 101}, 1).

run(0, Money, _Chances, _Boundaries,  _)                     -> {finished, Money};
run(N, Money, _Chances, {Low, _High}, _) when Money < Low    -> {fail, Money, N};
run(N, Money, _Chances, {_Low, High}, _) when Money > High   -> {win, Money, N};
run(N, Money, _Chances, {_Low, _High}, X) when X > 9000       -> {finished, Money, N};
run(N, Money,  Chances,  Boundaries,  X)                     ->
  Spin = spin(X, Chances),
  run(N - 1, Money + Spin, Chances, Boundaries, makeNextStake(X, Spin, Chances)).

makeNextStake(_, S, _) when S > 0  -> 1;
makeNextStake(X, _, {W, _})     -> (X * 1.9)/ W.

spin(X, {A, B}) -> choose((rand:uniform(16) > 8), A, B) * X.

choose(P, A, _) when P  -> A;
choose(_, _, B)         -> B.


