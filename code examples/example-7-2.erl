-module(patternmatching_tests).
-include_lib("eunit/include/eunit.hrl").

always_return_42_test() ->
  ?assertEqual(42, patternmatching:always_return_42()).

return_42_if_when_true_test() ->
  ?assertEqual(42, patternmatching:return_42_if_when_true(true)).

return_42_if_when_true_fails_test() ->
  ?assertEqual(0, patternmatching:return_42_if_when_true(false)).
