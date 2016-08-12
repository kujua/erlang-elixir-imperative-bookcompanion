-module(erlangexamples_server).
-behaviour(gen_server).

-record(state, { }).
-export([ start_link/0,
          init/1,
          handle_call/3,
          handle_cast/2,
          handle_info/2,
          terminate/2,
          code_change/3]).
-define(SERVER, ?MODULE).

start_link() ->
    gen_server:start_link({local, erlangexamples_server}, erlangexamples_server, [], []).

init([]) ->
    {ok, #state{}}.

handle_call({F, A}, _From, State) ->
  Reply = process_request({F,A}),
  {reply, Reply, State};
handle_call(_Request, _From, State) ->
  Reply = done,
  {reply, Reply, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, [1]}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
