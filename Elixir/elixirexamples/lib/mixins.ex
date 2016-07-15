defmodule RecipeMixins do
  defmacro __using__(_opts) do
    quote location: :keep do
      def print(l, dev \\ :stdio) do
        IO.puts(dev, inspect l)
      end
      defoverridable [print: 2]
    end
  end
end

defmodule VegStewM do
  use RecipeMixins
  def cook(dev \\ :stdio) do
    l = %{{:carot,:piece} => 3,
      {:onion,:piece} => 2,
      {:tomato,:piece} => 2
     }
    # do something
    print(l, dev)
  end
end

defmodule BeefStewM do
  use RecipeMixins
  def cook(dev \\ :stdio) do
    l = %{{:carot,:piece} => 3,
      {:onion,:piece} => 2,
      {:tomato,:piece} => 2,
      {:beef,:grams} => 250
     }
    # do something
    %{{:beef,:grams} => g} = l
    print(g, dev)
  end

  def print(g, dev) do
    IO.puts(dev, ("How much beef? " <> inspect g) <> " grams")
  end
end
