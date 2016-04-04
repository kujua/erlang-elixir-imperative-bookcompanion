-module(erlangexamples_client).
-export([pm/0]).

pm() ->
  S = gen_server:call(erlangexamples_server, {always_return_42, [55,true]}),
  io:format("return sent: ~n", []),
  case S of
    {ret,_,_} -> io:format("rep ~p~n", [S]);
    _ -> io:format("unknown ~p~n", [S])
  end.
