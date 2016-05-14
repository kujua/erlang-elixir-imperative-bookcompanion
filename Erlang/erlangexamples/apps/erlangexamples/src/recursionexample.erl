%%%-------------------------------------------------------------------
%%% @author Wolfgang Loder
%%% @doc
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(recursionexample).
-author("Wolfgang Loder").

-export([ tailrecursiveloop/1,
          nontailrecursiveloop/1,
          duplicate/2,
          doubletail/1,
          doubletailreversed/1,
          doublebody/1
        ]).

% infinite loop
tailrecursiveloop(N) ->
    io:format("~w~n", [N]),
    tailrecursiveloop(N+2).

% infinite loop with stack overflow
nontailrecursiveloop(N) ->
    io:format("~w~n", [N]),
    2 * nontailrecursiveloop(N).

% duplicates term and returns a list
duplicate(N, Term) -> duplicate(N, Term, []).

duplicate(0, _, List) -> List;
duplicate(N,_,List) when N < 0 -> List;
duplicate(N, Term, List) ->
  duplicate(N-1, Term, [Term|List]).

% doubles list element values and returns list
% tail recursive
doubletail(L) -> doubletail(L, []).

doubletail([],Acc) -> lists:reverse(Acc);
doubletail([H|T],Acc) -> doubletail(T,[2*H|Acc]).

% doubles list element values and returns list in reversed order
% tail recursive
doubletailreversed(L) -> doubletailreversed(L, []).

doubletailreversed([],Acc) -> Acc;
doubletailreversed([H|T],Acc) -> doubletailreversed(T,[2*H|Acc]).

% doubles list element values and returns list
% body recursive
doublebody([H|T]) -> [2*H | doublebody(T)];
doublebody([]) -> [].
