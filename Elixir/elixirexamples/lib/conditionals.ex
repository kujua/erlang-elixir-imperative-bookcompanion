defmodule Conditionals do
  def return_boolean(n) when n == 42 do
    true
  end
  def return_boolean(_n) do
    false
  end

  def fun_return_boolean() do
    fn n when n == 42 -> true
       _ -> false
    end
  end
end
