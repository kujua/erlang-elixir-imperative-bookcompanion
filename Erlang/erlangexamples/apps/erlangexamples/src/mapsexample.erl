%%%-------------------------------------------------------------------
%%% @author Wolfgang Loder
%%% @doc
%%% Erlang and Elixir for Imperative Programmers, 2016
%%% Chapter 13 - Map and Lists
%%% @end
%%%-------------------------------------------------------------------
-module(mapsexample).
-author("Wolfgang Loder").

-export([pizza_toppings_map/0,
         pizza_topping_match_invalid/0,
         pizza_topping_match_valid/0,
         pizza_topping_update_v1/0,
         pizza_topping_update_v2/0,
         pizza_topping_add/0
        ]).

pizza_toppings_map() ->
		#{{tomatosauce,spoon} => 3,
      {mozzarella,slices} => 8,
      {ham,slices} => 6,
      {mushroom,spoon} => 2,
      {spinach,spoon} => 2,
      {onion,spoon} => 2,
      {onionring,spoon} => 2,
      {sausage,piece} => 1
     }.

pizza_topping_match_invalid() ->
    M = pizza_toppings_map(),
    #{ {butter,teaspoons} := I} = M,
    I.

pizza_topping_match_valid() ->
    M = pizza_toppings_map(),
    #{ {mozzarella,slices} := I} = M,
    I.

pizza_topping_update_v1() ->
    M = pizza_toppings_map(),
    M1 = M#{{mozzarella,slices} := 5},
    M1.

pizza_topping_update_v2() ->
    M = pizza_toppings_map(),
    M1 = M#{{mozzarella,slices} => 6},
    M1.

pizza_topping_add() ->
    M = pizza_toppings_map(),
    M1 = M#{{mozzarella,slices} := 5, {pepperoni,piece} => 3},
    M1.
