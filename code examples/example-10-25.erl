{Tqs, _} = cowboy_req:qs_val(<<"testmode">>, Req),
Body =
  case Tqs of
    undefined -> test_response(Testmode);
    <<>> -> test_response(Testmode);
    _ -> test_response(list_to_atom(binary_to_list(Tqs)))
  end.
