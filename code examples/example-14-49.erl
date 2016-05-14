append([H|T], Tail) ->
    [H|append(T, Tail)];
append([], Tail) ->
    Tail.
