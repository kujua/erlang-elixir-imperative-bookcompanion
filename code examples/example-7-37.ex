defmodule DarImagelib.Mixfile do
  use Mix.Project

  def project do
    [
      app: :dar_imagelib,
      version: "0.0.1",
      elixir: "~> 1.1",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      dialyzer:
      [
         plt_apps: ["erts","kernel","stdlib","crypto","public_key","mnesia"],
         flags: ["-Wunmatched_returns","-Werror_handling",
                 "-Wrace_conditions", "-Wno_opaque"],
         paths: ["."]
      ]
    ]
  end

  def application do
    [mod: {DarImagelib.App, []},
    applications: [:logger,:mogrify]]
  end

  defp deps do
    [
      {:mogrify,path: "~/Projects/mogrify"},
      {:dar_model,path: "~/Projects/creative-common-dar/Erlang/Libs/dar_model"},
      {:ex_doc, "~> 0.11", only: :dev},
      {:dialyxir, "~> 0.3", only: [:dev]}
    ]
  end

  def getconstant(c) do
    globdefs = %{
      respath:
        "~/Projects/creative-common-dar/Elixir/Libs/dar_imagelib/test/res/"
    }
    case c do
      :respath -> globdefs.respath
      _ -> ""
    end
  end

end
