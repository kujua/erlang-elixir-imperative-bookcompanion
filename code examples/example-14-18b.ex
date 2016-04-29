
# enumerable protocol
def reverse(enumerable) when is_list(enumerable) do
    :lists.reverse(enumerable)
end
