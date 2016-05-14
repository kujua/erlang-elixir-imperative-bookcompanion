-module(dar_gfslib_process_files_mock_tests).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

-define (FILETEST, "filetest").
-define (FILETESTWRITE, "filetestwrite").
-define (FILETESTCONTENT, <<"test_from_gfslib">>).
-define (DARDB, "dar").
-define (NOTDARDB, "notdar").

save_to_gfs_no_connection_mocked_test() ->
    M = #{name => ?FILETESTWRITE,origin=>"test",timestamp=>100, gfsid=>"66"},
    meck:new(mongodb,[passthrough]),
    meck:expect(mongodb, is_connected, fun(def) -> false end),
    ?assertError({badmatch,false}, dar_gfslib_process_files:save_to_gfs(?FILETESTCONTENT,M,?DARDB)),
    ok = meck:unload(mongodb).

read_from_gfs_no_connection_mocked_test() ->
    meck:new(mongodb,[passthrough]),
    meck:expect(mongodb, is_connected, fun(def) -> false end),
    ?assertError({badmatch,false}, dar_gfslib_process_files:read_from_gfs(?FILETEST,?DARDB)),
    ok = meck:unload(mongodb).

connect_to_server_mocked_test() ->
    meck:new(mongodb,[passthrough]),
    meck:expect(mongodb, is_connected, fun(def) -> false end),
    R = dar_gfslib_process_files:connect(),
    ?assert(meck:validate(mongodb)),
    ?assertEqual(false, R),
    ok = meck:unload(mongodb).

-endif.
