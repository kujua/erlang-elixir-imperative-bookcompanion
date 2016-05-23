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
