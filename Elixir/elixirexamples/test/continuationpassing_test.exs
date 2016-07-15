defmodule ContinuationPassingTest do
  use ExUnit.Case

  test "initiate_ok" do
    ret = ContinuationPassing.initiate {:ok,1}
    assert ret == {:stopped}
  end

  test "initiate_error" do
    ret = ContinuationPassing.initiate {:ok,2}
    assert ret == :error
  end

end
