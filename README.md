# Datamusex

Datamuse API wrapper

## Installation

The package can be installed
by adding `datamusex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:datamusex, "~> 0.1.0"}
  ]
end
```

## Usage

```elixir
iex> "donut" |> Datamusex.similar_meaning
%Datamusex.ParamList{
  params: [%Datamusex.Param{name: :similar_meaning, value: "donut"}]
}

iex> "computer" |> Datamusex.similar_meaning |> Datamusex.triggered_by |> Datamusex.get_words
{:ok,
 %HTTPoison.Response{
    body: [
         %{"score" => 1442, "word" => "programmer"},
         ...

iex> "donut" |> Datamusex.similar_meaning |> Datamusex.triggered_by("torus") |> Datamusex.get_words
{:ok,
 %HTTPoison.Response{
    body: [
         %{"score" => 1799, "word" => "toroid"},
         ...


Datamusex.suggestions("car")
```


