def noassignment_nowarning(flag, v1) do
  case flag do
    true -> {:processed, v1+21}
    _ -> {:notprocessed, v1}
  end
end
