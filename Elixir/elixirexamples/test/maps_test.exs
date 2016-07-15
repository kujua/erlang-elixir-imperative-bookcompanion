defmodule MapsTest do
  use ExUnit.Case

  test "pizza_toppings_map" do
    ret = Maps.pizza_toppings_map
    assert ret == %{{:ham, :slices} => 6, {:mozzarella, :slices} => 8,
                     {:mushroom, :spoon} => 2, {:onion, :spoon} => 2,
                     {:onionring, :spoon} => 2, {:sausage, :piece} => 1,
                     {:spinach, :spoon} => 2, {:tomatosauce, :spoon} => 3}
  end

  test "pizza_topping_match_invalid" do
    ret = Maps.pizza_topping_match_invalid
    assert ret == nil
  end

  test "pizza_topping_match_valid" do
    ret = Maps.pizza_topping_match_valid
    assert ret == 8
  end

  test "pizza_topping_update" do
    ret = Maps.pizza_topping_update
    assert ret == %{{:ham, :slices} => 6, {:mozzarella, :slices} => 5,
                     {:mushroom, :spoon} => 2, {:onion, :spoon} => 2,
                     {:onionring, :spoon} => 2, {:sausage, :piece} => 1,
                     {:spinach, :spoon} => 2, {:tomatosauce, :spoon} => 3}
  end

  test "pizza_topping_add" do
    ret = Maps.pizza_topping_add
    assert ret == %{{:ham, :slices} => 6, {:mozzarella, :slices} => 8,
                     {:mushroom, :spoon} => 2, {:onion, :spoon} => 2,
                     {:onionring, :spoon} => 2, {:sausage, :piece} => 1,
                     {:spinach, :spoon} => 2, {:tomatosauce, :spoon} => 3,
                     {:pepperoni, :piece} => 3}
  end

  test "pizza_topping_get_value" do
    ret = Maps.pizza_topping_get_value
    assert ret == 8
  end
end
