@moduledoc """
Author: Wolfgang Loder
Email: wolfgang.loder@googlemail.com
Date: June 2016
Book Erlang and Elixir for Imperative Programmers, Chapter 15
"""
@doc """
Behaviour Examples
"""


defmodule Stewtype do
  defstruct stewtype: :veg, ingredients: []
end

defmodule Printer do
  @type stew :: Stewtype.t
  @callback print(stew) :: {:ok, term} | {:error, term}
end

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
