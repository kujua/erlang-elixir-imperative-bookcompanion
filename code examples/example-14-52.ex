def append([h|t], tail) do
    [h|append(t, tail)]
end
def append([], tail) do
    tail
end
