defmodule Specifications do
  @type returnvalue :: {:ok} | {:error}
  @spec numberfunction(number) :: returnvalue

  def numberfunction(t) do
    case t do
      42 -> {:ok}
      _  -> {:error}
    end
  end

  def callnumberfunction_1() do
    numberfunction("1")
  end

  def callnumberfunction_2() do
    numberfunction({})
  end

  def callnumberfunction_3() do
    numberfunction(0)
  end

  def callnumberfunction_4() do
    numberfunction(42)
  end
end
