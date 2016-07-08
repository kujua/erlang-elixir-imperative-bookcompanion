defmodule Records do
  require Record

  Record.defrecord :documentrecord, docid: 0, name: ""

  @type documentrecord::record(:documentrecord, docid: integer, name: String.t)

  def get_default_docrec do
    documentrecord()
  end

  def create_from_record(d) do
    documentrecord(docid: documentrecord(d,:docid)+1, name: documentrecord(d,:name))
  end

  def function_create_from_record do
    fn (d) -> documentrecord(docid: documentrecord(d,:docid)+1, name: documentrecord(d,:name)) end
  end
end
