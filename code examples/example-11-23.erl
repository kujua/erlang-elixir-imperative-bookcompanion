-module(dar_gfslib_process_files_tests).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

-define (FILETEST, "Test.pdf").
-define (FILETESTWRITE, "Test.pdf").
-define (FILETESTCONTENT, <<"testbinary">>).
-define (DARDB, "dar").
-define (NOTDARDB, "notdar").

connect_to_server_test() ->
    R = dar_gfslib_process_files:connect(),
    ?assertEqual(true, R).

read_binary_test() ->
    R = dar_gfslib_process_files:read_binary(?FILETEST,?DARDB),
    ?assertEqual({ok,?FILETESTCONTENT}, R).

write_binary_test() ->
    R = dar_gfslib_process_files:write_binary(?FILETESTCONTENT,?FILETESTWRITE,?DARDB),
    ?assertEqual({ok,?FILETESTWRITE}, R).

read_from_gfs_test() ->
    R = dar_gfslib_process_files:read_from_gfs(?FILETEST,?DARDB).
    ?assertEqual({ok,?FILETESTCONTENT,?FILETEST}, R).

save_to_gfs_test() ->
    {ok, Bin} = file:read_file("/Users/Wolfgang/Projects/Mats.pdf"),
    M = #{name => ?FILETESTWRITE,origin=>"test",timestamp=>100, gfsid=>"66"},
    R = dar_gfslib_process_files:save_to_gfs(Bin,M,?DARDB),
    ?assertEqual({ok,?FILETESTWRITE}, R).

connect_to_server_noconnection_mocked_test() ->
    meck:new(mongodb,[passthrough]),
    meck:expect(mongodb, is_connected, fun(def) -> false end),
    R = dar_gfslib_process_files:connect(),
    ?assert(meck:validate(mongodb)),
    ?assertEqual(false, R),
    ok = meck:unload(mongodb).

save_to_gfs_no_connection_mocked_test() ->
    M = #{name => ?FILETESTWRITE,origin=>"test",timestamp=>100, gfsid=>"66"},
    meck:new(mongodb,[passthrough]),
    meck:expect(mongodb, is_connected, fun(def) -> false end),
    ?assertError({badmatch,false}, dar_gfslib_process_files:save_to_gfs(?FILETESTCONTENT,M,?DARDB)),
    ok = meck:unload(mongodb).

save_to_gfs_wrong_db_test() ->
    M = #{name => ?FILETESTWRITE,origin=>"test",timestamp=>100, gfsid=>"66"},
    ?assertError({badmatch,?DARDB}, dar_gfslib_process_files:save_to_gfs(?FILETESTCONTENT,M,?NOTDARDB)).

read_from_gfs_wrong_db_test() ->
    ?assertError({badmatch,?DARDB}, dar_gfslib_process_files:read_from_gfs(?FILETEST,?NOTDARDB)).

read_from_gfs_no_connection_mocked_test() ->
    meck:new(mongodb,[passthrough]),
    meck:expect(mongodb, is_connected, fun(def) -> false end),
    ?assertError({badmatch,false}, dar_gfslib_process_files:read_from_gfs(?FILETEST,?DARDB)),
    ok = meck:unload(mongodb).

-endif.
