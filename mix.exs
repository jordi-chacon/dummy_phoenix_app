defmodule DummyPhoenixApp.Mixfile do
  use Mix.Project

  def project do
    [app: :dummy_phoenix_app,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {DummyPhoenixApp, []},
     applications: [:phoenix, :phoenix_html, :cowboy, :logger,
                    :phoenix_ecto, :postgrex, :httpoison, :mix,
                    :edown, :exometer, :exometer_core],
     included_applications: []
    ]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:edown, github: "uwiger/edown", tag: "0.7", override: true},
     {:exometer, github: "PSPDFKit-labs/exometer"},
     {:exometer_core, github: "PSPDFKit-labs/exometer_core", override: true},
     {:phoenix, github: "phoenixframework/phoenix", branch: "master", override: true},
     {:phoenix_ecto, "~> 0.4"},
     {:postgrex, ">= 0.0.0"},
     {:phoenix_html, "~> 1.0"},
     {:phoenix_live_reload, "~> 0.4", only: :dev},
     {:cowboy, "~> 1.0"},
     {:httpoison, "~> 0.7.0"},
     {:exrm, "0.18.6"},
     {:meck, "~> 0.8.2", override: true}]
  end
end
