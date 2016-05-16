defmodule RecipeMixins do
  defmacro __using__(_opts) do
    quote location: :keep do
      def print(l) do
        IO.puts(inspect l)
      end
      defoverridable [print: 1]
    end
  end
end

defmodule VegetableStew do
  use RecipeMixins
  def cook() do
    l = %{{:carot,:piece} => 3,
      {:onion,:piece} => 2,
      {:tomato,:piece} => 2
     }
    # do something
    print(l)
  end
end

defmodule BeefStew do
  use RecipeMixins
  def cook() do
    l = %{{:carot,:piece} => 3,
      {:onion,:piece} => 2,
      {:tomato,:piece} => 2,
      {:beef,:grams} => 250
     }
    # do something
    %{{:beef,:grams} => g} = l
    print(g)
  end

  def print(g) do
    IO.puts(("How much beef? " <> inspect g) <> " grams")
  end
end
