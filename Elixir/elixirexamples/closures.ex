@moduledoc """
Author: Wolfgang Loder
Email: wolfgang.loder@googlemail.com
Date: June 2016
Book Erlang and Elixir for Imperative Programmers, Chapter 14
"""
@doc """
Clojure Examples
"""

defmodule ClosuresExample do
    def initiate_closure do
        [:tomato,:onion,:cheese]
            |> Enum.map &(fn () -> &1 end)
    end

    def print_closure do
        initiate_closure
            |> Enum.each &(IO.puts(&1.()))
    end
end
