-module(optimized).

-export([main/1]).

main([Arg| _]) ->
    {N, _} = string:to_integer(Arg),
    StartTime = erlang:timestamp(),
    Res = get_result(N),
    EndTime = erlang:timestamp(),
    io:format("~B result : ~B~n", [N, Res]),
    io:format("Time : ~f~n", [timer:now_diff(EndTime, StartTime)/1000000]),
    erlang:halt().

get_result(N) -> run(N, 0).

run(   1, Base) -> 3 + Base;
run(Days, Base) -> runL(Days - 1, run(Days - 1, runA(Days - 1, Base))).

runL(   1, Base) -> 2 + Base;
runL(Days, Base) -> runL(Days - 1, runLA(Days - 1, Base)).

runA(   1, Base) -> 3 + Base;
runA(Days, Base) -> runL(Days - 1, run(Days - 1, runAA(Days - 1, Base))).

runLA(   1, Base) -> 2 + Base;
runLA(Days, Base) -> runL(Days - 1, runLAA(Days - 1, Base)).

runAA(   1, Base) -> 2 + Base;
runAA(Days, Base) -> runL(Days - 1, run(Days - 1, Base)).

runLAA(   1, Base) -> 1 + Base;
runLAA(Days, Base) -> runL(Days - 1, Base).




run(    2, _Absent, _Days, Base) -> Base;
run(_Late,       3, _Days, Base) -> Base;
run(_Late, _Absent,     0, Base) -> Base + 1;
run( Late,  Absent,  Days, Base) ->
    run(Late + 1, 0, Days - 1,
        run(Late, 0, Days - 1,
            run(Late, Absent + 1, Days - 1, Base))).


