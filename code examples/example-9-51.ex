iex(1)> nbo = Calendar.DateTime.now! "Africa/Nairobi"
%DateTime{calendar: Calendar.ISO, day: 23, hour: 12, microsecond: {149378, 6},
 minute: 31, month: 7, second: 54, std_offset: 0, time_zone: "Africa/Nairobi",
 utc_offset: 10800, year: 2016, zone_abbr: "EAT"}
iex(2)> nbo |> Calendar.DateTime.shift_zone!("Europe/Vienna")
            |> Calendar.DateTime.Format.iso8601
"2016-07-23T11:31:54.149378+02:00"
