p = {:ok,{:note,""}}
{:ok,_} = p # -> {:ok, {:note, ""}}
{ret,_} = p # ->{:ok, {:note, ""}}
ret # -> :ok
[] = p # -> (MatchError) no match of right hand side value: {:ok, {:note, ""}}
