-module(darapi_handler_home).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

init(_Type, Req, []) ->
	{ok, Req, undefined}.

handle(Req, State) ->
  {ok, Body} = homepage_dtl:render([]),
  Headers = [{<<"content-type">>, <<"text/html">>}],
  {ok, Reply} = cowboy_req:reply(200, Headers, Body, Req),
  {ok, Reply, State}.

terminate(_Reason, _Req, _State) ->
  ok.
