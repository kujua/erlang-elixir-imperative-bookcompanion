defmodule ExUnitMeck do
    use ExUnit.Case

    test "dar_model_assetmetadata_empty_mocked_test" do
        :ok = :meck.new :dar_model
        :meck.expect :dar_model, :assetmetadata_empty, fn -> :changed end
        assert :meck.validate :dar_model
        assert :dar_model.assetmetadata_empty == :changed
        :ok = :meck.unload :dar_model
    end
end
