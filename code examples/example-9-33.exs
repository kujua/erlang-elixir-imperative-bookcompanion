
def application do
  [
      mod: {DarDblib.App, []},
      applications: [:logger, :exlager]
  ]
end

defp deps do
  [
      {:lager, git: "https://github.com/basho/lager.git"},
      {:exlager ,git: "https://github.com/khia/exlager.git"}
  ]
end
