defmodule CalendarTest do
  use ExUnit.Case

  test "get_datetime" do
    ret = CalendarExamples.get_datetime
    assert is_bitstring(ret)
  end

end
