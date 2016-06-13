-record(state, {
    testmode :: get_apiassets | post_apiassets
}).

init(_Type, Req, Opts) ->
  {_, Testmode} = lists:keyfind(testmode, 1, Opts),
  {ok, Req, #state{testmode=Testmode}}.

handle(Req, State=#state{testmode=Testmode}) ->
  lager:info("test_response state: ~p~n", [lager:pr(Testmode, ?MODULE)]),
  Body = test_response(Testmode),
  {ok, Reply, State}.
