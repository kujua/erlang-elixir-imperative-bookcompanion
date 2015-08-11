%%%-------------------------------------------------------------------
%%% @author Wolfgang Loder
%%% @doc
%%% This module is a basic example of
%%%    (1) sending messages between processes and
%%%    (2) distribute processes on different machines.
%%% @end
%%%-------------------------------------------------------------------
-module(sayhello).
-author("Wolfgang Loder").

%% API
-export([start/0, recipient/0, say_hello/2, say_hello/3, start_recipient/0, start_sayhello/1]).

%% methods for distributed processes on more than one machine
say_hello(What, 0, Node) ->
  io:format("Process arity 3 'say_hello' finished~n", []),
  {precipient, Node} ! finished;
say_hello(What, Times, Node) ->
%%   Node ! {log, self()},
  io:format("3: ~p~n", [What]),
  say_hello(What, Times - 1, Node).

start_recipient() ->
  register(precipient, spawn(sayhello, recipient, [])).

start_sayhello(InitNode) ->
  spawn(sayhello, say_hello, [hi, 2, InitNode]).

%% methods for processes on one machine
say_hello(What, 0) ->
  io:format("Process arity 2 'say_hello' finished~n", []),
  precipient ! finished;
say_hello(What, Times) ->
  io:format("2: ~p~n", [What]),
  say_hello(What, Times - 1).

%% recipient of say_hello-messages
recipient() ->
  receive
    finished ->
      io:format("Recipient process finished~n", []);
    {log, _} ->
      io:format("Recipient received log message~n", []),
      recipient();
    _ ->
      io:format("Recipient received unknown message~n", []),
      recipient()
  end.

start() ->
  register(precipient, spawn(sayhello, recipient, [])),
  precipient ! stillnomessagedefined,
  spawn(sayhello, say_hello, [hi, 4]).

