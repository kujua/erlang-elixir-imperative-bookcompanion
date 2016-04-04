%%%-------------------------------------------------------------------
%% @doc erlangexamples top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(erlangexamples_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
    { ok,
      {
        {one_for_all, 0, 1},
        [
          {erlangexamples_server,
            {erlangexamples_server, start_link, []},
            transient,
            60000,
            worker,
            [erlangexamples_server]
          }
        ]
      }
    }.

%%====================================================================
%% Internal functions
%%====================================================================
