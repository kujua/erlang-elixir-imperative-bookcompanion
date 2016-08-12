start() ->
  register(precipient, spawn(sayhello, recipient, [])),
  precipient ! nomessagedefined,
  spawn(sayhello, say_hello, ["Hello", 4]).
