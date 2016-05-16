iex(1)> num = 3
3
iex(2)> quote do rem(unquote(num),2) == 0 end
{:==, [context: Elixir, import: Kernel],
 [{:rem, [context: Elixir, import: Kernel], [3, 2]}, 0]}
