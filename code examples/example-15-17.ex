iex(1)> s = %Stewtype{}
%Stewtype{ingredients: [], stewtype: :veg}
iex(2)> Stew.print(s)
"It's a vegetable stew"
iex(3)> sb = %{s|stewtype: :beef}
%Stewtype{ingredients: [], stewtype: :beef}
iex(4)> StewProtocol.what_is_it?(sb)
"It's a beef stew"
iex(5)> su = %{s|stewtype: :chicken}
%Stewtype{ingredients: [], stewtype: :chicken}
iex(6)> StewProtocol.what_is_it?(su)
"Unknown stew"
