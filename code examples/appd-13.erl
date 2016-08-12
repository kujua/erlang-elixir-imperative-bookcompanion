-record(documentrecord, {docid, name}).

R = #documentrecord{docid=123, name="name"}.
  % -> #documentrecord{docid = 123,name = "name"}

R#documentrecord.name. % -> "name"

F = fun(#documentrecord{docid=DocId} = D) ->
            D#documentrecord{docid=DocId+1} end.
F(R). % -> #documentrecord{docid = 124,name = "name"}
R. % R is not changed -> #documentrecord{docid = 123,name = "name"}
