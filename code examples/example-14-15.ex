def return_42_cond_when_true(flag) do
  cond do
    flag ->
      42
    1 ->
      0
  end
end
