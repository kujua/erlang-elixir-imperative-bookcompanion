defmodule CalendarExamples do
  def get_datetime do
    nbo = Calendar.DateTime.now! "Africa/Nairobi"
    nbo |> Calendar.DateTime.shift_zone!("Europe/Vienna")
        |> Calendar.DateTime.Format.iso8601
  end
end
