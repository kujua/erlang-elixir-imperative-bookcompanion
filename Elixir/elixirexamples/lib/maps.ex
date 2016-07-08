defmodule Maps do

  def pizza_toppings_map() do
  		%{{:tomatosauce,:spoon} => 3,
        {:mozzarella,:slices} => 8,
        {:ham,:slices} => 6,
        {:mushroom,:spoon} => 2,
        {:spinach,:spoon} => 2,
        {:onion,:spoon} => 2,
        {:onionring,:spoon} => 2,
        {:sausage,:piece} => 1
       }
  end

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

  def syntaxexamples do
      m1 = %{1 => "m1"}
      m2 = %{:a1 => "m2"}
      m1[1]   # -> "m1"
      m1[2]   # -> nil
      m2.a1    # -> "m2"
      m2.b    # -> ** (KeyError) key :b not found in: %{a1: "m2"}
      m2[:a1]  # -> "m2"
      m2[:b]  # -> nil
  end
end
