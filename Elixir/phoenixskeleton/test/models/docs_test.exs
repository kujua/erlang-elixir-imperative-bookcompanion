defmodule Phoenixskeleton.DocsTest do
  use Phoenixskeleton.ModelCase

  alias Phoenixskeleton.Docs

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Docs.changeset(%Docs{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Docs.changeset(%Docs{}, @invalid_attrs)
    refute changeset.valid?
  end
end
