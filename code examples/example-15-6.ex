iex(1)> num = 3
3
iex(2)> Macro.to_string(quote do rem(unquote(num),2) == 0 end)
"rem(3, 2) == 0"
