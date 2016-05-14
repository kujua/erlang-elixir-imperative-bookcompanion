def pizza_topping_match_invalid() do
    m = pizza_toppings_map()
    Map.get m,{:butter,:teaspoons}
end

def pizza_topping_match_valid() do
    m = pizza_toppings_map()
    Map.get m,{:mozzarella,:slices}
end

def pizza_topping_update() do
    m = pizza_toppings_map()
    %{m | {:mozzarella,:slices} => 5}
end

def pizza_topping_add() do
    m = pizza_toppings_map()
    Map.put(m, {:pepperoni,:piece}, 3)
end

def pizza_topping_get_value() do
    m = pizza_toppings_map()
    %{{:mozzarella,:slices} => value} = m
    value
end
