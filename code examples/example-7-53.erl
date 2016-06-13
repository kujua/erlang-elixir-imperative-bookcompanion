-module (fixture_tests).
-include_lib("eunit/include/eunit.hrl").

fixture1_test_() ->
     { setup,
       fun setup/0,
       fun cleanup/1,
       ?_test(
          begin
            I = 42,
            ?assertEqual(42,I)
          end
       )
     }.

fixture2_test_() ->
    { setup,
      fun setup/0,
      fun cleanup/1,
      [
        {"assert true",
        fun() ->
            ?assert(false)
        end},
        {"assert 42",
        fun() ->
            I = 42,
            ?assertEqual(42,I)
        end}
      ]
    }.

setup() ->
    {ok}.

cleanup(_Pid) ->
    {ok}.
