-define(IF(A,T,F),
    begin
      (case (A) of true->(T); false->(F) end)
    end).

is_true(A) ->
  ?IF(A,{ok,A},{error,A}).

% expanded to
is_true(A) ->
  case (A) of true->{ok,A}; false->{error,A} end.
