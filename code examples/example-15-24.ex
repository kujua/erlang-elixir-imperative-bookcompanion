defmodule Stewtype do
  defstruct stewtype: :veg, ingredients: []
end

defmodule Printer do
  @type stew :: Stewtype.t
  @callback print(stew) :: {:ok, term} | {:error, term}
end
