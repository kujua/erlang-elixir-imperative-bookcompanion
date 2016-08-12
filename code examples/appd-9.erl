P = {ok,{note,""}}.
{ok,_} = P. % -> {ok,{note,[]}}
{Ret,_} = P. % -> {ok,{note,[]}}
Ret. % -> ok
[] = P. % -> exception error: no match of right hand side value {ok,{note,[]}}
