def initiate(a) do
    case a do
        {:ok,1} -> continue({:ok,2},&continueB/1)
        _ -> :error
    end
end

defp continue(a,f) do
    f.(a)
end

defp continueB(a) do
    case a do
        {:ok,2} -> continue({:stop},&continueC/1)
        _ -> :error
    end
end

defp continueC(a) do
    case a do
        {:stop} -> {:stopped}
        _ -> :error
    end
end
