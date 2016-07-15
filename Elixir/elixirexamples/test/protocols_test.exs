defmodule ProtocolsTest do
  use ExUnit.Case

  test "veg stew" do
    s = %Stewtype{stewtype: :veg}
    ret = Protocols.Stew.print(s)
    assert ret == "It's a vegetable stew"
  end

  test "beef stew" do
    s = %Stewtype{stewtype: :beef}
    ret = Protocols.Stew.print(s)
    assert ret == "It's a beef stew"
  end

  test "unknown stew" do
    s = %Stewtype{stewtype: :chicken}
    ret = Protocols.Stew.print(s)
    assert ret == "Unknown stew"
  end

end
