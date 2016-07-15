defmodule RecordsTest do
  use ExUnit.Case
  require Records

  test "get_default_docrec" do
    ret = Records.get_default_docrec
    assert ret == {:documentrecord, 0, ""}
  end

  test "create_from_record" do
    ret = Records.create_from_record Records.documentrecord()
    assert ret == {:documentrecord, 1, ""}
  end

  test "function_create_from_record" do
    ret = Records.function_create_from_record
    assert ret.(Records.documentrecord()) == {:documentrecord, 1, ""}
  end

end
