-module(dar_gfslib_process_files).

-ifdef(TEST).
  -export([
              connect/0,
              read_binary/2,
              write_binary/3
          ]).
-endif.

-define (DARDB, "dar").
-export([
            read_from_gfs/2,
            save_to_gfs/3
        ]).
-include_lib("erlmongo/src/erlmongo.hrl").

read_from_gfs(Name,DB) ->
    DB = ?DARDB,
    {ok,B} = read_binary(Name,DB),
    {ok,B,Name}.

save_to_gfs(Binary,Meta,DB) ->
    DB = ?DARDB,
    {ok, Name} = validate_meta(Meta),
    {ok,N} = write_binary(Binary, Name,DB),
    {ok,N}.

validate_meta(M) ->
    ok = dar_model:validate_meta(M),
    #{name := Name} = M,
    {ok,Name}.

write_binary(B,N,DB) ->
    DB = ?DARDB,
    true = connect(),
    Mong = mongoapi:new(def,list_to_binary(DB)),
    Mong:gfsIndexes(),
    PID = Mong:gfsNew(N),
    Mong:gfsWrite(PID,B),
    Mong:gfsClose(PID),
    {ok,N}.

read_binary(Name,DB) ->
    DB = ?DARDB,
    true = connect(),
    Mong = mongoapi:new(def,list_to_binary(DB)),
    Mong:gfsIndexes(),
    PID = Mong:gfsOpen(#gfs_file{filename = Name}),
    B = Mong:gfsRead(PID,5000000),
    Mong:gfsClose(PID),
    {ok,B}.


connect() ->
    mongodb:singleServer(def),
    mongodb:connect(def),
    timer:sleep(200),
    mongodb:is_connected(def).
