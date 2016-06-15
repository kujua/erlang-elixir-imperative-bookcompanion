Erlang/OTP 18 [erts-7.1] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Eshell V6.4  (abort with ^G)
1> Double = fun(X) -> 2 * X end.
#Fun<erl_eval.6.90072148>
2> lists:map(Double, [1,2,3,4,5]).
[2,4,6,8,10]
3>
