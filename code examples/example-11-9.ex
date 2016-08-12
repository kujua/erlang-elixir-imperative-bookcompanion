defmodule DARModelExternalMessage do
  @derive [Poison.Encoder]
  defstruct gfsid:        "",
            name:         "",
            comment:      "",
            actions:      []
            use ExConstructor

  def from_json m do
    Poison.decode! m
  end

  def to_json m do
    Poison.encode! m
  end
end
