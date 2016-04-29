initiate_closure() ->
    [tomato,onion,cheese].

print_closure() ->
    L = initiate_closure(),
    lists:map(fun(A)-> io:format("~p~n", [A]) end, L).
