defmodule KeywordListsTest do
  use ExUnit.Case

  test "create_pizza_order" do
    ret = KeywordLists.create_pizza_order
    assert ret == [{:margerita, 1},{:calzone, 2}]
  end

  test "add_to_order" do
    ret = KeywordLists.add_to_order
    assert ret == [margerita: 1, calzone: 2, roma: 1]
  end

  test "jump_the_queue" do
    ret = KeywordLists.jump_the_queue
    assert ret == [roma: 1, margerita: 1, calzone: 2]
  end

  test "add_the_same" do
    ret = KeywordLists.add_the_same
    assert ret == [margerita: 1, calzone: 2, margerita: 2]
  end
end
