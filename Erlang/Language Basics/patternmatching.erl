%%%-------------------------------------------------------------------
%%% @author Wolfgang Loder
%%% @doc
%%% Erlang and Elixir for Imperative Programmers, 2016
%%% Chapter 14 - Pattern Matching
%%% @end
%%%-------------------------------------------------------------------
-module(patternmatching).
-author("Wolfgang Loder").

-export([always_return_42/0, return_42_if_when_true/1,return_42_case_when_true/1,incorrect_case/2,guard_function/1]).

always_return_42() ->
	42.

return_42_if_when_true(Flag) ->
  if
    Flag =:= true ->
      42;
    true ->
      0
  end.

return_42_case_when_true(Flag) ->
  case Flag of
    true -> 42;
    _ -> 0
  end.

incorrect_case(a,b) ->
  case a == b of
    true -> -1;
    false -> 0
  end;
incorrect_case(a,Y) ->
  case Y > 0 of
    true -> 42;
    false -> 0
  end;
incorrect_case(_,Y) ->
  case Y > 0 of
    true -> 43;
    false -> 0
  end.

guard_function(Flag) when Flag == true -> 42;
guard_function(Flag) when Flag == false -> 0.
