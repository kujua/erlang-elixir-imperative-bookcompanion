def assignment_warning(flag, v1) do
  ret = if (flag) do
          v1 = v1 + 21
          :processed
        else
          :notprocessed
        end
  {ret, v1}
end
