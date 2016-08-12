S = "hello world".
string:len(S). % -> 11
string:equal(S,"hello"). % -> false
string:concat("hello", " world"). % -> "hello world"
string:tokens(S,[$ ]). % -> ["hello","world"]
string:to_upper(S). % -> "HELLO WORLD"
