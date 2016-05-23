cookstew_patternmatching({vegetable,_I}) ->
  io:fwrite("It is a vegetable stew~n");
cookstew_patternmatching({beef,_I}) ->
  io:fwrite("It is a beef stew~n");
cookstew_patternmatching(_) ->
  io:fwrite("Unknown stew~n").
