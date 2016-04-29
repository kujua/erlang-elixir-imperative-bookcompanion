%% methods for processes on one machine
say_hello(_, 0) ->
  io:format("Process arity 2 'say_hello' finished~n", []),
  precipient ! finished;
say_hello(What, Times) ->
  io:format("2: ~p~n", [What]),
  precipient ! What,
  say_hello(What, Times - 1).
