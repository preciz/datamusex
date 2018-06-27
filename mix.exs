defmodule Datamusex.MixProject do
  use Mix.Project

  def project do
    [
      app: :datamusex,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      description: "Datamuse API wrapper",
      deps: deps(),
      package: package(),
      name: "Datamusex",
      source_url: "https://github.com/preciz/datamusex"
    ]
  end

  def application do
    [
      extra_applications: []
    ]
  end

  defp deps do
    [
      {:poison, "~> 2.0 or ~> 3.0"},
      {:httpoison, "~> 1.0"},
    ]
  end

  defp package() do
    [
      maintainers: ["Barna Kovacs"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/preciz/datamusex"}
    ]
  end
end
