connect() ->
    mongodb:singleServer(def),
    mongodb:connect(def),
    mongodb:is_connected(def).
