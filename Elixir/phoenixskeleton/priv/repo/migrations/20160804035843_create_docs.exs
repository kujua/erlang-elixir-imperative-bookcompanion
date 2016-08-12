defmodule Phoenixskeleton.Repo.Migrations.CreateDocs do
  use Ecto.Migration

  def change do
    create table(:doc) do
      add :name, :string

      timestamps()
    end

  end
end
