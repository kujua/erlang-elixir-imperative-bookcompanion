pizza_topping_match_invalid() ->
    M = pizza_toppings_map(),
    #{ {butter,teaspoons} := I} = M,
    I.
