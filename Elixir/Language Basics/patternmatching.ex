defmodule Patternmatching do
@moduledoc """
Erlang and Elixir for Imperative Programmers, 2016
Chapter 14 - Pattern Matching
"""

  def always_return_42 do
    42
  end

  def always_return_42_short, do: 42

  def return_42_cond_when_true(flag) do
    cond do
      flag ->
        42
      1 ->
        0
    end
  end

  def return_42_case_when_true(flag) do
    case flag do
      true -> 42
      _ -> 0
    end
  end

  def incorrect_case(a,b) do
      case a == b do
        true -> 0
        false -> -1
      end
  end

  @spec incorrect_case_spec(atom(),atom()) :: number()
  def incorrect_case_spec(a,b) do
    case a == b do
      true -> 0
      false -> -1
    end
  end

  def incorrect_case_guards(a,b) when is_atom(a) and is_atom(b) do
    case a == b do
      true -> 0
      false -> -1
    end
  end

  def case_with_guards(a,b) when is_number(a) and is_number(b) do
    case a == b do
      true -> true
      _ -> false
    end
  end

  def case_with_guards(a,b) when is_atom(a) and is_atom(b) do
    case a == b do
      true -> true
      _ -> false
    end
  end

  def call() do
    incorrect_case(1,1)
  end

end
