doubletailreversed(L) -> doubletailreversed(L, []).

doubletailreversed([],Acc) -> Acc;
doubletailreversed([H|T],Acc) -> doubletailreversed(T,[2*H|Acc]).
