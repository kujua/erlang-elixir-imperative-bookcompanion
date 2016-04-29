incorrect_case(a,b) ->
  case a == b of
    true -> -1;
    false -> 0
  end;
incorrect_case(a,Y) ->
  case Y > 0 of
    true -> 42;
    false -> 0
  end;
incorrect_case(_,Y) ->
  case Y > 0 of
    true -> 43;
    false -> 0
  end.
  
