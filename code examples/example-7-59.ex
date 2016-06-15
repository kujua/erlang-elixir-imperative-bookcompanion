defmodule ListExample do
  require IEx

  def append([h|t], tail) do
      IEx.pry
      [h|append(t, tail)]
  end
  def append([], tail) do
      tail
  end
end
