cookstew_typebased({S,I}) when {S,I} == {vegetable,I} ->
  io:fwrite("It is a vegetable stew~n");
cookstew_typebased({S,I}) when {S,I} == {beef,I} ->
  io:fwrite("It is a beef stew~n");
cookstew_typebased(_) ->
  io:fwrite("Unknown stew~n").
