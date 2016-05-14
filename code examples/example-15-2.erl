-define (FILETESTCONTENT, <<"test_from_gfslib">>).
-define (FILETEST, "filetest").
-define (DARDB, "dar").

read_binary_test() ->
    R = dar_gfslib_process_files:read_binary(?FILETEST,?DARDB),
    ?assertEqual({ok,?FILETESTCONTENT}, R).

% expanded to:
read_binary_test() ->
    R = dar_gfslib_process_files:read_binary("filetest","dar"),
    ?assertEqual({ok,<<"test_from_gfslib">>}, R).
