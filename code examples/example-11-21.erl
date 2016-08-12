connect() ->
    mongodb:singleServer(def),
    mongodb:connect(def),
    timer:sleep(200),
    mongodb:is_connected(def).
