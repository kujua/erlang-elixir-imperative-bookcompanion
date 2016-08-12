m = %{{:tomatosauce,:spoon} => 3,
      {:mozzarella,:slices} => 8,
      {:ham,:slices} => 6
     }

Map.get m,{:ham,:slices} # get value -> 6

%{m | {:mozzarella,:slices} => 6} # update
  # -> %{{:ham, :slices} => 6, {:mozzarella, :slices} => 6,
  #      {:tomatosauce, :spoon} => 3}

Map.put(m, {:pepperoni,:piece}, 3) # add
  # -> %{{:ham, :slices} => 6,
  #      {:mozzarella, :slices} => 8,
  #      {:pepperoni, :piece} => 3,
  #      {:tomatosauce, :spoon} => 3}
