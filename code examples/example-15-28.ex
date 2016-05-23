defmodule Specifications do
  @type returnvalue :: {:ok} | {:error}
  @spec numberfunction(number) :: returnvalue

  def numberfunction(t) do
    case t do
      42 -> {:ok}
      _  -> {:error}
    end
  end
end
