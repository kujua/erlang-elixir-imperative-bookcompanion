-module(meck_mock_tests).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

-define (FILETESTWRITE, "filetestwrite").
-define (FILETESTCONTENT, <<"test_from_gfslib">>).
-define (DARDB, "dar").

save_to_gfs_mocked_test() ->
    M = #{name => ?FILETESTWRITE,origin=>"test",timestamp=>100, gfsid=>"66"},
    ok = meck:new(dar_gfslib_process_files),
    meck:expect(dar_gfslib_process_files, save_to_gfs, fun(?FILETESTCONTENT,M,?DARDB) -> {nodb,?FILETESTWRITE} end),
    R = dar_gfslib_process_files:save_to_gfs(?FILETESTCONTENT,M,?DARDB),
    ?assert(meck:validate(dar_gfslib_process_files)),
    ?assertEqual({nodb,?FILETESTWRITE}, R),
    ok = meck:unload(dar_gfslib_process_files).

dar_model_assetmetadata_empty_mocked_test() ->
    ok = meck:new(dar_model),
    meck:expect(dar_model, assetmetadata_empty, fun() -> changed end),
    ?assertEqual(dar_model:assetmetadata_empty(),changed),
    ok = meck:unload(dar_model).

-endif.
