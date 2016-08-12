defmodule Phoenixskeleton.Repo.Migrations.CreateImage do
  use Ecto.Migration

  def change do
    create table(:images) do

      timestamps()
    end

  end
end
