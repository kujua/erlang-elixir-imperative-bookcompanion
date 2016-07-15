defmodule ConditionalsTest do
  use ExUnit.Case

  test "fun_return_boolean_f" do
    ret = Conditionals.fun_return_boolean
    assert ret.(1) == false
  end

  test "fun_return_boolean_t" do
    ret = Conditionals.fun_return_boolean
    assert ret.(42) == true
  end
_ = 2
  test "return_boolean_f" do
    assert Conditionals.return_boolean(1) == false
  end

  test "return_boolean_t" do
    assert Conditionals.return_boolean(42) == true
  end
end
