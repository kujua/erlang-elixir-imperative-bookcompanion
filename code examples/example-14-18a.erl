tailrecursiveloop(N) ->
    io:format("~w~n", [N]),
    tailrecursiveloop(N+2).

nontailrecursiveloop(N) ->
    io:format("~w~n", [N]),
    2 * nontailrecursiveloop(N).
