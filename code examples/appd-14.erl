M = #{{tomatosauce,spoon} => 3,
      {mozzarella,slices} => 8,
      {ham,slices} => 6
     }.

#{{ham,slices} := I} = M % get value
  % -> #{{ham,slices} => 6,{mozzarella,slices} => 8,{tomatosauce,spoon} => 3}
I. % -> 6

M#{{mozzarella,slices} => 6}. % update
  % -> #{{ham,slices} => 6,{mozzarella,slices} => 6,{tomatosauce,spoon} => 3}

M#{{mozzarella,slices} := 5, {pepperoni,piece} => 3}. % update and add
  % ->  #{{ham,slices} => 6,
  %      {mozzarella,slices} => 5,
  %      {pepperoni,piece} => 3,
  %      {tomatosauce,spoon} => 3}
