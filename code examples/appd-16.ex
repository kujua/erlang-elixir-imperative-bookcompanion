defmodule Documentrecord do
  defstruct docid: 0, name: ""
end

%Documentrecord{} # -> %Documentrecord{docid: 0, name: ""}

d = %Documentrecord{docid: 123, name: "name"}
  # -> %Documentrecord{docid: 123, name: "name"}
d.docid # -> 123

%{d | name: "Joe"} # updating
  # -> %Documentrecord{docid: 123, name: "Joe"}
d # d is unchanged -> %Documentrecord{docid: 123, name: "name"}

is_map(d) # -> true (structs are maps with fixed set of fields)
