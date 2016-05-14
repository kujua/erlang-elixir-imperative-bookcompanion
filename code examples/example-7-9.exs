defmodule ExUnitAssertions do
    use ExUnit.Case, async: true

    @tag :wip
    test "assert" do
        assert 1 + 1 == 2
    end

    test "refute" do
        refute 1 + 1 == 3
    end

    test "assert_in_delta" do
        assert_in_delta 1,4,5
    end

    test "refute_in_delta" do
        refute_in_delta 1,4,3
    end
end
