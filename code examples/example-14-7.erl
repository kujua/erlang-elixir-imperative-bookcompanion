pizza_topping_match_valid() ->
    M = pizza_toppings_map(),
    #{ {mozzarella,slices} := I} = M,
    I.
