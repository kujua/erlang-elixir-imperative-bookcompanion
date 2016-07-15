defmodule HigherOrderFunctionsTest do
  use ExUnit.Case

  test "call_function" do
    ret = HigherOrderFunctions.call_function fn n -> n*2 end,21
    assert ret == 42
  end

  test "call_with_fn" do
    ret = HigherOrderFunctions.call_with_fn
    assert ret == 25
  end

  test "call_with_variable" do
    ret = HigherOrderFunctions.call_with_variable
    assert ret == 16
  end

  test "direct_call" do
    ret = HigherOrderFunctions.direct_call
    assert ret == 9
  end

  test "call_with_variable_shorthand" do
    ret = HigherOrderFunctions.call_with_variable_shorthand
    assert ret == 16
  end

  test "direct_call_shorthand" do
    ret = HigherOrderFunctions.direct_call_shorthand
    assert ret == 9
  end
end
