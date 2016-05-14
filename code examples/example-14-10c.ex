m1 = %{1 => "m1"}
m2 = %{:a1 => "m2"}
m1[1]                 # -> "m1"
m1[2]                 # -> nil
m2.a1                 # -> "m2"
m2.b                  # -> ** (KeyError) key :b not found in: %{a1: "m2"}
m2[:a1]               # -> "m2"
m2[:b]                # -> nil
