defmodule Assignment do
  def assignment_warning(flag, v1) do
    ret = if (flag) do
            v1 = v1 + 21
            :processed
          else
            :notprocessed
          end
    {ret, v1}
  end

  def noassignment_nowarning(flag, v1) do
    case flag do
      true -> {:processed, v1+21}
      _ -> {:notprocessed, v1}
    end
  end
end
