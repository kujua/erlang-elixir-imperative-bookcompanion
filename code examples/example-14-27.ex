def multiply(x,y) do
    x*y
end

def doubler() do
    fn x -> multiply(2,x) end
end

def curry() do
    c = doubler()
    c.(21)
end
