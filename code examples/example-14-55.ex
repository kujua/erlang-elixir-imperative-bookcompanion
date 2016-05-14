def comprehension_ex1() do
  mod2? = fn(i) -> rem(i, 2) == 0 end
  for i <- 1..10, mod2?.(i), do: i*10
end
