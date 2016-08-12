pizza_topping_match_invalid() ->
    M = pizza_toppings_map(),
    #{ {butter,teaspoons} := I} = M,
    I.
% mapsexample:pizza_topping_match_invalid().
% -> exception error: no match of right hand side value #{{ham,slices} => 6,
%                                                     {mozzarella,slices} => 8,
%                                                     {mushroom,spoon} => 2,
%                                                     {onion,spoon} => 2,
%                                                     {onionring,spoon} => 2,
%                                                     {sausage,piece} => 1,
%                                                     {spinach,spoon} => 2,
%                                                     {tomatosauce,spoon} => 3}
