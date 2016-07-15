defmodule ElixirExamples.Mixfile do
  use Mix.Project

  def project do
  [
    app: :elixirexamples,
    version: "1.0.0",
    elixir: "~> 1.3",
    build_embedded: Mix.env == :prod,
    start_permanent: Mix.env == :prod,
    deps: deps,
    dialyzer:
    [
       plt_apps: ["erts","kernel", "stdlib", "crypto", "public_key", "mnesia"],
       flags: ["-Wunmatched_returns","-Werror_handling","-Wrace_conditions", "-Wno_opaque"],
       paths: ["."]
    ]
   ]
  end

  def application do
    [
        applications: [:logger, :timex]
    ]
  end

  defp deps do
    [
      {:dialyxir, "~> 0.3", only: [:dev]},
      {:poison, "~> 2.0"},
      {:calendar, "~> 0.16.0"},
      {:timex, "~> 2.1.5"}
    ]
  end
end
