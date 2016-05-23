-module (specifications).
-compile(export_all).

-type returnvalue() :: {ok} | {error}.
-export_type([returnvalue/0]).

-spec numberfunction(number()) -> returnvalue().
numberfunction(T) ->
  case T of
    42 -> {ok};
    _  -> {error}
  end.

callnumberfunction_1() ->
  numberfunction("test").

callnumberfunction_2() ->
  numberfunction({}).

callnumberfunction_3() ->
  numberfunction(0).

callnumberfunction_4() ->
  numberfunction(42).
