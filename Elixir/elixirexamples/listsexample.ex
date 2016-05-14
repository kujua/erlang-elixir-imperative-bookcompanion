defmodule ListExample do
  def append([h|t], tail) do
      [h|append(t, tail)]
  end
  def append([], tail) do
      tail
  end

  def comprehension_ex1() do
    mod2? = fn(i) -> rem(i, 2) == 0 end
    for i <- 1..10, mod2?.(i), do: i*10
  end

  def comprehension_ex2(list) do
    for n <- list, into:  "", do: n <> " "
  end

  def reduce(list) do
    sum = fn(x, y) -> x + y end
    list |> Enum.reduce(0, sum)
  end
end
