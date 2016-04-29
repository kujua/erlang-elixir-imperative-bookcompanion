doubletail(L) -> doubletail(L, []).

doubletail([],Acc) -> lists:reverse(Acc);
doubletail([H|T],Acc) -> doubletail(T,[2*H|Acc]).
