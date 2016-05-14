def reduce(list) do
  sum = fn(x, y) -> x + y end
  list |> Enum.reduce(0, sum)
end
