-module(eventhandler).
-behaviour(gen_event).
-export([
  init/1, terminate/2, handle_info/2,
  handle_call/2, code_change/3, handle_event/2
]).
-record(state, {course = "undefined"}).

init([]) ->
  {ok, #state{} }.

handle_info(_Info, State) ->
  {ok, State}.

handle_call(_Request, State) ->
  {ok, not_implemented, State}.

handle_event(Event, S) ->
  io:format("Old State: ~p~n", [S]),
  io:format("Event: ~s~n", [Event]),
  {ok, S#state{course=Event}}.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.

terminate(_Arg, S) ->
  io:format("State: ~p~n", [S]),
  io:format("Terminate ~n"),
  ok.
