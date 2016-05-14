defmodule ExUnitAssertionsReceive do
    use ExUnit.Case, async: true

    test "assert_receive" do
        send self, {:hello, "world"}
        assert_receive {:hello, "world"}
    end

    test "refute_receive" do
        send self, {:hello, "world"}
        refute_receive {:hello, ""}
    end

    test "assert_received" do
        send self, {:hello, "world"}
        assert_received {:hello, _}
    end

    test "refute_received" do
        refute_received {:hello, _}
    end
end
