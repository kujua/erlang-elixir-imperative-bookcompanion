defmodule VegStew do
  @behaviour Printer
  def print(s) do
    case s.stewtype do
      :veg ->
        {:ok, "It's a vegetable stew"}
      _ ->
        {:error, "Unknown stew"}

    end
  end
end

defmodule BeefStew do
  @behaviour Printer
  def print(s) do
    case s.stewtype do
      :beef ->
        {:ok, "It's a beef stew"}
      _ ->
        {:error, "Unknown stew"}
    end
  end
end
