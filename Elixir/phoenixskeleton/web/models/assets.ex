defmodule Phoenixskeleton.Assets do
  use Phoenixskeleton.Web, :model

  schema "asset" do
    field :name, :string
    field :gfsid, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :gfsid])
    |> validate_required([:name, :gfsid])
  end
end
