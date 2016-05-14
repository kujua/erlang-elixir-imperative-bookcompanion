def create_pizza_order() do
  [{:margerita, 1},{:calzone, 2}]
end

def add_to_order() do
  kwl = create_pizza_order
  kwl ++ [roma: 1]
end

def jump_the_queue() do
  kwl = create_pizza_order
  [roma: 1] ++ kwl
end

def add_the_same() do
  kwl = create_pizza_order
  kwl ++ [margerita: 2]
end
