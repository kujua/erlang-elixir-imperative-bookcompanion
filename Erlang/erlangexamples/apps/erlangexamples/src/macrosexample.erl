-module (macrosexample).

-compile(export_all).

-define(IF(A,T,F),
    begin
      (case (A) of true->(T); false->(F) end)
    end).

is_true(A) ->
  ?IF(A,{ok,A},{error,A}).

is_true_expanded(A) ->
  case (A) of true->{ok,A}; false->{error,A} end.

-define(IF2(A,T,F),
    begin
      (case (A) of true-> (T()); false->(F()) end)
    end).

send_message_to_next_actor(B) ->
  ValidOrder = {pizza,margherita},
  T = fun() -> self() ! {order, {pizza,margherita}, takeaway} end,
  F = fun() -> self() ! {noorder, B} end,
  ?IF2(B == ValidOrder,T, F).
