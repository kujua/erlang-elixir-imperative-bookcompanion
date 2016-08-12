def getimagelist_as_string(imagelist) do
  {_,s} = Enum.map_reduce(
    (for n <- imagelist, do: n <> " "),
    [],
    fn(name,acc) -> {name,List.insert_at(acc,-1,add_path(name))} end)
  List.to_string(s)
end

defp add_path(filename) do
  Path.join(DarImagelib.Mixfile.getconstant(:respath),filename)
end
