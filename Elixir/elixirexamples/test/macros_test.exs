defmodule MacrosTest do
  use ExUnit.Case

  test "even_t" do
    ret = Macros.is_even? 42
    assert ret == true
  end

  test "even_f" do
    ret = Macros.is_even? 21
    assert ret == false
  end

end
