defmodule SpecificationsTest do
  use ExUnit.Case
  # require Specifications

  test "numberfunction_t" do
    ret = Specifications.numberfunction 42
    assert ret == {:ok}
  end

  test "numberfunction_f" do
    ret = Specifications.numberfunction 21
    assert ret == {:error}
  end

  test "callnumberfunction_1" do
    ret = Specifications.callnumberfunction_1
    assert ret == {:error}
  end

  test "callnumberfunction_2" do
    ret = Specifications.callnumberfunction_2
    assert ret == {:error}
  end

  test "callnumberfunction_3" do
    ret = Specifications.callnumberfunction_3
    assert ret == {:error}
  end

  test "callnumberfunction_4" do
    ret = Specifications.callnumberfunction_4
    assert ret == {:ok}
  end
end
