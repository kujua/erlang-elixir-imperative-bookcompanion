return_42_if_when_true(Flag) ->
  if
    Flag =:= true ->
      42;
    true ->
      0
  end.
