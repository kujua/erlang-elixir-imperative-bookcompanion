defmodule Phoenixskeleton.Repo.Migrations.CreateAssets do
  use Ecto.Migration

  def change do
    create table(:asset) do
      add :name, :string
      add :gfsid, :string

      timestamps()
    end

  end
end
