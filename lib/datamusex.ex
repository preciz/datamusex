defmodule Datamusex do
  @moduledoc """
  Datamuse elixir wrapper
  """

  use HTTPoison.Base

  words_endpoints = [
    similar_meaning: :ml,
    sound_like: :ml,
    spelled_similarly: :sp,
    rhyme_with: :rel_rhy,
    used_to_describe: :rel_jjb,
    often_follow: :lc,
    triggered_by: :rel_trg
  ]

  words_endpoints
  |> Enum.each(fn {name, query_param} ->
    def unquote(name)(words, headers \\ [], options \\ [])
        when is_binary(words) and is_list(headers) and is_list(options) do
      default_params = [{unquote(query_param), process_words(words)}]

      options = options |> Keyword.update(:params, default_params, &(&1 ++ default_params))

      get(
        "words",
        headers,
        options
      )
    end
  end)

  def suggestions(words, headers \\ [], options \\ [])
      when is_binary(words) and is_list(headers) and is_list(options) do
    default_params = [s: process_words(words)]

    options = options |> Keyword.update(:params, default_params, &(&1 ++ default_params))

    get(
      "sug",
      headers,
      options
    )
  end

  def process_words(words) when is_binary(words) do
    words
    |> String.split(" ")
    |> Enum.join("+")
  end

  def process_url(url) do
    "https://api.datamuse.com/" <> url
  end

  def process_response_body(body) do
    body |> Poison.decode!()
  end
end
