@moduledoc """
Author: Wolfgang Loder
Email: wolfgang.loder@googlemail.com
Date: June 2016
Book Erlang and Elixir for Imperative Programmers, Chapter 14
"""
@doc """
Currying Examples
"""

defmodule Currying do
    def multiply(x,y) do
        x*y
    end

    def doubler() do
        fn x -> multiply(2,x) end
    end

    def curry() do
        c = doubler()
        c.(21)
    end
end
