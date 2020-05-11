-module(generic).

-export([main/1]).

main([Arg| _]) ->
    {N, _} = string:to_integer(Arg),
    StartTime = erlang:timestamp(),
    Res = get_result(N),
    EndTime = erlang:timestamp(),
    io:format("~B result : ~B~n", [N, Res]),
    io:format("Time : ~f~n", [timer:now_diff(EndTime, StartTime)/1000000]),
    erlang:halt().

get_result(N) -> run(0, 0, N, 0).

run(    2, _Absent, _Days, Base) -> Base;
run(_Late,       3, _Days, Base) -> Base;
run(_Late, _Absent,     0, Base) -> Base + 1;
run( Late,  Absent,  Days, Base) ->
    run(Late + 1, 0, Days - 1,
        run(Late, 0, Days - 1,
            run(Late, Absent + 1, Days - 1, Base))).


