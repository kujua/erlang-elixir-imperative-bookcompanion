pizza_topping_update_v1() ->
    M = pizza_toppings_map(),
    M1 = M#{{mozzarella,slices} := 5},
    M1.

pizza_topping_update_v2() ->
    M = pizza_toppings_map(),
    M1 = M#{{mozzarella,slices} => 6},
    M1.
