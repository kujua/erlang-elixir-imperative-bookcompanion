iex(1)> s = %Stewtype{}
%Stewtype{ingredients: [], stewtype: :veg}
iex(2)> sb = %{s|stewtype: :beef}
%Stewtype{ingredients: [], stewtype: :beef}
iex(3)> su = %{s|stewtype: :chicken}
%Stewtype{ingredients: [], stewtype: :chicken}
iex(4)> VegStew.print(s)
{:ok, "It's a vegetable stew"}
iex(5)> sb = %{s|stewtype: :beef}
%Stewtype{ingredients: [], stewtype: :beef}
iex(6)> su = %{s|stewtype: :chicken}
%Stewtype{ingredients: [], stewtype: :chicken}
iex(7)> VegStew.print(sb)
{:error, "Unknown stew"}
iex(8)> BeefStew.print(sb)
{:ok, "It's a beef stew"}
iex(9)> BeefStew.print(s)
{:error, "Unknown stew"}
iex(10)> BeefStew.print(su)
{:error, "Unknown stew"}
iex(11)> VegStew.print(su)
{:error, "Unknown stew"}
iex(12)> VegStew.print(s)
{:ok, "It's a vegetable stew"}
