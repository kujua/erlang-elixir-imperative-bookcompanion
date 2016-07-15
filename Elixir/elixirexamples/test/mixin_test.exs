defmodule MixinsTest do
  use ExUnit.Case

  test "VegStew cook" do
    {:ok, pid} = StringIO.open("testdevice")
    VegStewM.cook pid
    {_,{_,s}} = StringIO.close(pid)
    assert is_bitstring(s)
    assert s == "%{{:carot, :piece} => 3, {:onion, :piece} => 2, {:tomato, :piece} => 2}\n"
  end

  test "BeefStew cook" do
    {:ok, pid} = StringIO.open("testdevice")
    BeefStewM.cook pid
    {_,{_,s}} = StringIO.close(pid)
    assert is_bitstring(s)
    assert s == "How much beef? 250 grams\n"
  end

end
