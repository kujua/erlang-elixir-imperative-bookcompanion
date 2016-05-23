-module (polymorphism).
-compile(export_all).

veg_map() ->
		#{ stewtype => vegetable,
      {onion,piece} => 2
     }.

beef_map() ->
		#{ stewtype => beef,
      {beef,grams} => 200
     }.

beef_map_extended() ->
		#{ stewtype => beef,
      {beef,grams} => 200,
      ingredients => []
     }.

cookstew_typebased({S,I}) when {S,I} == {vegetable,I} ->
  io:fwrite("It is a vegetable stew~n");
cookstew_typebased({S,I}) when {S,I} == {beef,I} ->
  io:fwrite("It is a beef stew~n");
cookstew_typebased(_) ->
  io:fwrite("Unknown stew~n").

cookstew_patternmatching({vegetable,_I}) ->
  io:fwrite("It is a vegetable stew~n");
cookstew_patternmatching({beef,_I}) ->
  io:fwrite("It is a beef stew~n");
cookstew_patternmatching(_) ->
  io:fwrite("Unknown stew~n").

cookstew_record(#{stewtype := vegetable}) ->
  io:fwrite("It is a vegetable stew~n");
cookstew_record(#{stewtype := beef}) ->
  io:fwrite("It is a beef stew~n");
cookstew_record(_) ->
  io:fwrite("Unknown stew~n").
