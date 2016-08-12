require Record
Record.defrecord :documentrecord, docid: 0, name: ""
@type documentrecord::record(:documentrecord, docid: integer, name: String.t)

r = documentrecord(docid: 123,name: "name")
    # -> {:documentrecord, 123, "name"}

documentrecord(r,:name) # -> "name"

f = fn (d) ->
 documentrecord(docid: documentrecord(d,:docid)+1,name: documentrecord(d,:name))
end
f.(r) # -> {:documentrecord, 124, "name"}
r # r is not changed -> {:documentrecord, 123, "name"}
