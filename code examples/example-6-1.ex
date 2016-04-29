Erlang/OTP 17 [erts-6.4] [source] [64-bit] [async-threads:10] [kernel-poll:false]

Interactive Elixir (1.0.4) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> double = fn x-> 2 * x  end
#Function<6.90072148/1 in :erl_eval.expr/5>
iex(2)> Enum.map( [1,2,3,4,5],double)
[2, 4, 6, 8, 10]
iex(3)>
