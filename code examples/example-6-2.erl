Erlang/OTP 17 [erts-6.4] [source] [64-bit] [async-threads:10] [kernel-poll:false]

Eshell V6.4  (abort with ^G)
1> Double = fun(X) -> 2 * X end.
#Fun<erl_eval.6.90072148>
2> lists:map(Double, [1,2,3,4,5]).
[2,4,6,8,10]
3>
