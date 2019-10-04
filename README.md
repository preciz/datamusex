# Datamusex

Datamuse API wrapper

## Installation

The package can be installed
by adding `datamusex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:datamusex, "~> 0.3.0"}
  ]
end
```

## Usage

```elixir
iex> "donut" |> Datamusex.similar_meaning
%Datamusex.ParamList{
  params: [%Datamusex.Param{name: :similar_meaning, value: "donut"}]
}

iex> Datamusex.similar_meaning("computer") |> Datamusex.triggered_by("device") |> Datamusex.get_words
{:ok,
 %HTTPoison.Response{
    body: [
         %{"score" => 1318, "word" => "tablet"},
         ...

iex> Datamusex.similar_meaning("donut") |> Datamusex.triggered_by("torus") |> Datamusex.get_words
{:ok,
 %HTTPoison.Response{
    body: [
         %{"score" => 1799, "word" => "toroid"},
         ...


Datamusex.get_suggestions("car")
```


