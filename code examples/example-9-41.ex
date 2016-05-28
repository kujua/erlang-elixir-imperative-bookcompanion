iex(1)> timezone1 = Timex.timezone("Africa/Nairobi", Timex.DateTime.today)
#<Timezone(Africa/Nairobi - EAT (+03:00))>
iex(2)> Timex.DateTime.now
#<DateTime(2016-05-26T08:54:23Z)>
iex(3)> tu = Timezone.convert Timex.DateTime.now, timezone1
#<DateTime(2016-05-26T11:54:52 Africa/Nairobi (+03:00:00))>
iex(4)> tu |> Timex.format!("{ISO:Extended}")
"2016-05-26T11:54:52.785+03:00"
iex(5)> tu |> Timex.format!("{ANSIC}")
"Thu May 26 11:54:52 2016"
