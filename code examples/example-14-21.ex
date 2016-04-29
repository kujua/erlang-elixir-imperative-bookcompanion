def call_function(function,a) do
    function.(a)
end

def call_with_fn() do
    call_function(fn n -> n*n end,5)
end

def call_with_variable() do
    sqfunc = fn n -> n*n end
    call_function(sqfunc,4)
end

def direct_call() do
    fn n -> n*n end.(3)
end

def call_with_variable_shorthand() do
    sqfunc = &(&1*&1)
    call_function(sqfunc,4)
end

def direct_call_shorthand() do
    (&(&1*&1)).(3)
end
