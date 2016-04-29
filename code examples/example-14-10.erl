pizza_topping_add() ->
    M = pizza_toppings_map(),
    M1 = M#{{mozzarella,slices} := 5, {pepperoni,piece} => 3},
    M1.
