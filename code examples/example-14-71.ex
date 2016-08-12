def multiply(x,y) when is_number(x) and is_number(y) do
    x*y
end

def doubler() do
    fn x when is_number(x) -> multiply(2,x)  end
end
