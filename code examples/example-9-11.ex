$ iex --sname pinit --cookie scookie
Erlang/OTP 18 [erts-7.1] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Interactive Elixir (1.1.1) - press Ctrl+C to exit (type h() ENTER for help)
iex(pinit@Wolfgangs-MacBook-Pro)1> Node.connect :"precipient@Wolfgangs-MacBook-Pro"
true
iex(pinit@Wolfgangs-MacBook-Pro)2> SayHello.start_sayhello
Hello
Hello
:log
Process 'say_hello' finished
