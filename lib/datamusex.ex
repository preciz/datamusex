defmodule Datamusex do
  @moduledoc """
  Datamuse elixir wrapper
  """

  use HTTPoison.Base

  endpoints = [
    similar_meaning: :ml,
    sound_like: :ml,
    spelled_similarly: :sp,
    rhyme_with: :rel_rhy,
    used_to_describe: :rel_jjb,
    often_follow: :lc,
    triggered_by: :rel_trg,
    suggestions: :sug
  ]

  endpoints
  |> Enum.each(fn {name, query_param} ->
    def unquote(name)(words, extra_params \\ [])
        when is_binary(words) and is_list(extra_params) do
      get(
        "",
        [],
        params: [{unquote(query_param), words |> process_words}] ++ extra_params
      )
    end
  end)

  def process_words(words) when is_binary(words) do
    words
    |> String.split(" ")
    |> Enum.join("+")
  end

  def process_url(url) do
    "https://api.datamuse.com/words" <> url
  end

  def process_response_body(body) do
    body |> Poison.decode!()
  end
end
