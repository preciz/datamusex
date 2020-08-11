defmodule Datamusex.MixProject do
  use Mix.Project

  @version "0.4.1"
  @github "https://github.com/preciz/datamusex"

  def project do
    [
      app: :datamusex,
      version: @version,
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      description: "Datamuse API wrapper",
      deps: deps(),
      docs: docs(),
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
      {:httpoison, "~> 1.0"},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      main: "Datamusex",
      source_ref: "v#{@version}",
      source_url: @github,
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
