# Datamusex

API wrapper for the free [Datamuse](https://www.datamuse.com/api/) API.

## Installation

The package can be installed
by adding `datamusex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:datamusex, "~> 0.4"}
  ]
end
```

## Usage

```elixir
iex> Datamusex.similar_meaning("donut")
%Datamusex.ParamList{
  params: [%Datamusex.Param{name: :similar_meaning, value: "donut"}]
}

iex> Datamusex.similar_meaning("computer") |> Datamusex.triggered_by("device") |> Datamusex.get_words()
{:ok,
 %HTTPoison.Response{
    body: [
         %{"score" => 1318, "word" => "tablet"},
         ...

iex> Datamusex.similar_meaning("donut") |> Datamusex.triggered_by("torus") |> Datamusex.get_words()
{:ok,
 %HTTPoison.Response{
    body: [
         %{"score" => 1799, "word" => "toroid"},
         ...


Datamusex.get_suggestions("car")
```

## API wrapper functions

Execute the paramlist created by these functions with `get_words/3`:
```elixir
similar_meaning/2
sound_like/2
spelled_similarly/2
rhyme_with/2
used_to_describe/2
often_follow/2
triggered_by/2
synonyme/2
```

Autocomplete suggestions:
```elixir
get_suggestions/3
```

