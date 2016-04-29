call_function(F, A) -> F(A).

call_with_fun() ->
    call_function(fun(N) -> N*N end, 5).

call_with_variable() ->
    Sqfunc = fun(N) -> N*N end,
    call_function(Sqfunc,4).

direct_call() ->
    fun(N) -> N*N end(3).
