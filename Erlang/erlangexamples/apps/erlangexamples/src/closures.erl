%%%-------------------------------------------------------------------
%%% @author Wolfgang Loder
%%% @doc
%%% Erlang and Elixir for Imperative Programmers, 2016
%%% Chapter 14 - Closures
%%% @end
%%%-------------------------------------------------------------------
-module(closures).
-author("Wolfgang Loder").

-export ([print_closure/0]).

initiate_closure() ->
    [tomato,onion,cheese].

print_closure() ->
    L = initiate_closure(),
    lists:map(fun(A)-> io:format("~p~n", [A]) end, L).
