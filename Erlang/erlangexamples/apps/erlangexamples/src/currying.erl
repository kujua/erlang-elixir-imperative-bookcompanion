-module (currying).

-compile(export_all).

multiply(X, Y) -> X*Y.
doubler() -> fun(X) -> multiply(2, X) end.

curry() ->
    C = doubler(),
    C(21).
