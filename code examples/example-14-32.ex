def initiate_closure do
    [:tomato,:onion,:cheese]
        |> Enum.map &(fn () -> &1 end)
end

def print_closure do
    initiate_closure
        |> Enum.each &(IO.puts(&1.()))
end
