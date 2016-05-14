-module(dar_model_exception_tests).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl")

dar_model_assetmetadata_empty_mocked_with_failure_test() ->
    ok = meck:new(dar_model),
    meck:expect(dar_model, assetmetadata_empty, fun() -> erlang:error(deliberate_error_returned) end),
    catch dar_model:assetmetadata_empty(),
    ?assertNot(meck:validate(dar_model)),
    ok = meck:unload(dar_model).

dar_model_assetmetadata_empty_mocked_with_expected_failure_test() ->
    ok = meck:new(dar_model),
    catch dar_model:validate_meta({}),
    ?assert(meck:validate(dar_model)),
    ok = meck:unload(dar_model).

dar_model_assetmetadata_empty_with_expected_failure_test() ->
    ?assertError({badmatch,{}}, dar_model:validate_meta({})).

-endif.
