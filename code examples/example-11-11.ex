defmodule DARImageLib.Process do

  @respath "~/Projects/creative-common-dar/Backend/dar/apps/dar_imagelib/test/res/"

  defmacro path_resource(file, path \\ @respath) do
    Path.join(path,file)
  end

  # hard coded for testing
  def resize do
      Mogrify.open(path_resource("test.jpg"))
          |> Mogrify.copy
          |> Mogrify.resize("50x50")
          |> Mogrify.save(path_resource("test_resize.jpg"))
  end

  def watermark(imageprocessingmodel) do
      Mogrify.watermark(
        getimagelist_as_string(imageprocessingmodel.imagelist),
        getlist_as_string(imageprocessingmodel.options))

  end

  def getimagelist_as_string(imagelist) do
    {_,s} = Enum.map_reduce(
      (for n <- imagelist, do: n <> " "),
      [],
      fn(name,acc) -> {name,List.insert_at(acc,-1,add_path(name))} end)
    List.to_string(s)
  end

  def getlist_as_string(list) do
    for n <- list, into:  "", do: n <> " "
  end

  defp add_path(filename) do
    Path.join(@respath,filename)
  end
end
