-define(MACRO1(X, Y), {a, X, b, Y}).

bar(X) ->
    ?MACRO1(a, b),
    ?MACRO1(X, 123)

expanded to:
bar(X) ->
    {a,a,b,b},
    {a,X,b,123}.
