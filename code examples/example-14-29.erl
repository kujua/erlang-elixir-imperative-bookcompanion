continue(A,F) ->
    F(A).

initiate(A) ->
    case A of
        {ok,1} -> continue({ok,2},fun continueB/1);
        _ -> error
    end.

continueB(A) ->
    case A of
        {ok,2} -> continue({stop},fun continueC/1);
        _ -> error
    end.

continueC(A) ->
    case A of
        {stop} -> {stopped}
    end.
