defmodule ClosuresTest do
  use ExUnit.Case

  test "initiate closure" do
    ret = ClosuresExample.initiate_closure
    assert is_list(ret)
  end

end
