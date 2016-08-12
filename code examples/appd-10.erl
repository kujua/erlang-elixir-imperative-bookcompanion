% Guards in if and case see in section "Conditional"

return_boolean(N) when N =:= 42 -> true;
return_boolean(N) -> false.

FunReturnBoolean =
  fun
   (N) when N =:= 42 -> true;
   (N) -> false
  end.
