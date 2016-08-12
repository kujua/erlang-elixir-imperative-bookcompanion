l = [1,2,3]
hd(l) # -> 1
tl(l) # -> [2,3]
length(l) # -> 3
t = {hd(l),tl(l),"hello world"} # -> {1, [2, 3], "hello world"}
tuple_size(t) # -> 3
elem(t,1) # -> [2,3]
put_elem(t,1,[0]) # -> {1, [0], "hello world"}
t # t unchanged -> {1, [2, 3], "hello world"}
