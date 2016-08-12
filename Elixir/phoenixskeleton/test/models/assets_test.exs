defmodule Phoenixskeleton.AssetsTest do
  use Phoenixskeleton.ModelCase

  alias Phoenixskeleton.Assets

  @valid_attrs %{gfsid: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Assets.changeset(%Assets{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Assets.changeset(%Assets{}, @invalid_attrs)
    refute changeset.valid?
  end
end
