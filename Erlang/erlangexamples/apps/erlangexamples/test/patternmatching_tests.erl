-module(patternmatching_tests).
-include_lib("eunit/include/eunit.hrl").

always_return_42_test() ->
  42 = patternmatching:always_return_42().

return_42_if_when_true_test() ->
  42 = patternmatching:return_42_if_when_true(true).
