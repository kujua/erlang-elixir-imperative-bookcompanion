defmodule Stewtype do
  defstruct stewtype: :veg, ingredients: []
end

defmodule Protocols do
  defprotocol Stew do
    def print(data)
  end

  defimpl Stew, for: Stewtype do
    def print(s) do
      case s.stewtype do
        :veg ->
          "It's a vegetable stew"
        :beef ->
          "It's a beef stew"
        _ ->
          "Unknown stew"
      end
    end
  end
end

defmodule StewProtocol do
  def what_is_it?(stew) do
    Protocols.Stew.print(stew)
  end
end
