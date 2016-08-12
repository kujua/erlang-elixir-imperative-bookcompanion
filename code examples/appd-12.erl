L = [1,2,3].
hd(L). % -> 1
tl(L). % -> [2,3]
length(L). % -> 3
T = {hd(L),tl(L),"hello world"}. % -> {1,[2,3],"hello world"}
tuple_size(T). % -> 3
element(2,T). % -> [2,3]
setelement(2,T,[0]). % -> {1,[0],"hello world"}
T. % T unchanged -> {1,[2,3],"hello world"}
