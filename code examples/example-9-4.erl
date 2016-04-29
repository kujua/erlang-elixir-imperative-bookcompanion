%% recipient of say_hello-messages
recipient() ->
  receive
    finished ->
      io:format("Recipient process finished~n", []);
    log ->
      io:format("Recipient received log message~n", []),
      recipient();
    What ->
      io:format("Recipient received ~s~n", [What]),
      recipient()
  end.
