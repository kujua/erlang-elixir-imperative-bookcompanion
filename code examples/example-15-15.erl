beef_map() ->
		#{ stewtype => beef,
       {beef,grams} => 200
     }.

beef_map_extended() ->
		#{ stewtype => beef,
       {beef,grams} => 200,
       ingredients => []
     }.

cookstew_map(#{stewtype := vegetable}) ->
  io:fwrite("It is a vegetable stew~n");
cookstew_map(#{stewtype := beef}) ->
  io:fwrite("It is a beef stew~n");
cookstew_map(_) ->
  io:fwrite("Unknown stew~n").
