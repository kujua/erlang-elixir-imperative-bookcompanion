config :dar_metadata, DARMetaData.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "dar",
  hostname: "localhost"

config :dar_metadata, ecto_repos: [DARMetaData.Repo]
