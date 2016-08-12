Flag = false.

case Flag of
  true -> 42;
  _ -> 0
end.

if
  Flag =:= true ->
    42;
  true ->
    0
end.
