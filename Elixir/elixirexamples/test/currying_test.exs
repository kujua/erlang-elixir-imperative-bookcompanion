defmodule CurryingTest do
  use ExUnit.Case

  test "multiply" do
    ret = Currying.multiply 2,3
    assert ret == 6
  end

  test "doubler" do
    ret = Currying.doubler
    assert ret.(3) == 6
  end

  test "curry" do
    ret = Currying.curry
    assert ret == 42
  end

end
