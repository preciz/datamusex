defmodule Datamusex.MixProject do
  use Mix.Project

  @github "https://github.com/preciz/datamusex"

  def project do
    [
      app: :datamusex,
      version: "0.3.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      description: "Datamuse API wrapper",
      deps: deps(),
      package: package(),
      name: "Datamusex"
    ]
  end

  def application do
    [
      extra_applications: []
    ]
  end

  defp deps do
    [
      {:jason, "~> 1.1"},
      {:httpoison, "~> 1.0"}
    ]
  end

  defp package() do
    [
      maintainers: ["Barna Kovacs"],
      licenses: ["MIT"],
      links: %{"GitHub" => @github}
    ]
  end
end
