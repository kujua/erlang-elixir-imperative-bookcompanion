-module(darapi_app).
-behaviour(application).
-export([start/2
        ,stop/1]).
-define(
  ROUTES,
    [
      {"/api/assets", darapi_handler_assets, []},
      {"/api/assets/:id/text", darapi_handler_assets, []},
      {"/api/assets/:id/images", darapi_handler_assets, []},
      {"/api/assets/:id/images/:imgid", darapi_handler_assets, []},
      {"/api/assets/:id", darapi_handler_assets, []},
      {"/test", darapi_handler_testpage, []},
      {'_', darapi_handler_home, []}
    ]
).

start(_Type, _Args) ->
  Dispatch = cowboy_router:compile([{'_', ?ROUTES}]),
  {ok, _} = cowboy:start_http(
              http,
              100,
              [{port, 8402}],
              [{env, [{dispatch, Dispatch}]}]
             ),
  darapi_sup:start_link().

stop(_State) ->
    ok.
