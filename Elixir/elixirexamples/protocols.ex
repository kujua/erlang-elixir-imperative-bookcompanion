defmodule Stewtype do
  defstruct stewtype: :veg, ingredients: []
end

defmodule Protocols do
  defprotocol Stew do
    @fallback_to_any true
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

  defimpl Stew, for: Any do
    def print(_) do
      "This is not stew data!"
    end
  end
end

defmodule StewProtocol do
  def what_is_it?(stew) do
    Protocols.Stew.print(stew)
  end
end
