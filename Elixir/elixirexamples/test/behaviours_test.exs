defmodule BehavioursTest do
  use ExUnit.Case

  test "VegStew veg" do
    s = %Stewtype{stewtype: :veg}
    {ret,_} = VegStewB.print(s)
    assert ret == :ok
  end

  test "VegStew beef" do
    s = %Stewtype{stewtype: :beef}
    {ret,_} = VegStewB.print(s)
    assert ret == :error
  end

  test "BeefStew beef" do
    s = %Stewtype{stewtype: :beef}
    {ret,_} = BeefStewB.print(s)
    assert ret == :ok
  end

  test "BeefStew veg" do
    s = %Stewtype{stewtype: :veg}
    {ret,_} = BeefStewB.print(s)
    assert ret == :error
  end
end
