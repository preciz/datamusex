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
Datamusex.similar_meaning("car")
Datamusex.sound_like("car")
Datamusex.spelled_similarly("car")
Datamusex.rhyme_with("car")
Datamusex.used_to_describe("car")
Datamusex.often_follow("car")
Datamusex.triggered_by("car")
Datamusex.suggestions("car")
```


