%%%-------------------------------------------------------------------
%%% @author Wolfgang Loder
%%% @doc
%%% Erlang and Elixir for Imperative Programmers, 2016
%%% Chapter 13 - Map and Lists
%%% @end
%%%-------------------------------------------------------------------
-module(listsexample).
-author("Wolfgang Loder").

-export([improper_list/0, f_parsing_list/1,setup_ingredient_list/0]).

improper_list() ->
	L1 = [1 | someatom].

f_parsing_list(X) ->
	fun (T) ->
		case T of
			[X|T1] -> {ok, {const, X}, T1};
			_      -> fail
		end
	end.

setup_ingredient_list(dish) ->
		[{egg,2,piece},{butter,1,teaspoon}].
