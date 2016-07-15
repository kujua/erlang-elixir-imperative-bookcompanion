defmodule ListsExampleTest do
  use ExUnit.Case

  test "append" do
    ret = ListExample.append [1,2,3],[5]
    assert ret == [1,2,3,5]
  end

  test "comprehension_ex1" do
    ret = ListExample.comprehension_ex1
    assert ret == [20, 40, 60, 80, 100]
  end

  test "comprehension_ex2" do
    ret = ListExample.comprehension_ex2 ["1","2","3"]
    assert ret == "1 2 3 "
  end

  test "reduce" do
    ret = ListExample.reduce [1,2,3]
    assert ret == 6
  end
end
