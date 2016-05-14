-define(IF2(B,T,F),
    begin
      (case (B) of true-> (T()); false->(F()) end)
    end).

send_message_to_next_actor(B) ->
  ValidOrder = {pizza,margherita},
  T = fun() -> self() ! {order, {pizza,margherita}, takeaway} end,
  F = fun() -> self() ! {noorder, B} end,
  ?IF2(B == ValidOrder,T, F).
