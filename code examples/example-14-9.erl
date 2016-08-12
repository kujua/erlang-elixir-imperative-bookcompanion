pizza_topping_update_v1() ->
    M = pizza_toppings_map(),
    M1 = M#{{mozzarella,slices} := 5},
    M1.
% -> #{{ham,slices} => 6,
%   {mozzarella,slices} => 5, % changed from 8 to 5
%   {mushroom,spoon} => 2,
%   {onion,spoon} => 2,
%   {onionring,spoon} => 2,
%   {sausage,piece} => 1,
%   {spinach,spoon} => 2,
%   {tomatosauce,spoon} => 3}

pizza_topping_update_v2() ->
    M = pizza_toppings_map(),
    M1 = M#{{mozzarella,slices} => 6},
    M1.
% -> #{{ham,slices} => 6,
%   {mozzarella,slices} => 6, % changed from 8 to 6
%   {mushroom,spoon} => 2,
%   {onion,spoon} => 2,
%   {onionring,spoon} => 2,
%   {sausage,piece} => 1,
%   {spinach,spoon} => 2,
%   {tomatosauce,spoon} => 3}
