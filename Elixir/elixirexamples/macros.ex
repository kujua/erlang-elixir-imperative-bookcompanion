defmodule Macros do
  defmacrop even?(n) do
    quote do rem(unquote(n),2) == 0 end
  end

  def is_even?(n) do
    even?(n)
  end

  defmacro font do
    "Courier"
  end

  def show_font do
    font
  end
end
