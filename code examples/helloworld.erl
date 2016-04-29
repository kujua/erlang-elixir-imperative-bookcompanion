%%%-------------------------------------------------------------------
%%% @author Wolfgang
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Mar 2015 08:43
%%%-------------------------------------------------------------------
-module(helloworld).
-author("Wolfgang").

%% API
-export([add/2, hello/0, greet_and_add_two/1]).

add(A,B) ->
  A + B.

%% Shows greetings.
%% io:format/1 is the standard function used to output text.
hello() ->
  io:format("Hello, world!~n").

greet_and_add_two(X) ->
  hello(),
  add(X,2).