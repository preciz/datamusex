defmodule Datamusex.API do
  @moduledoc false
  use HTTPoison.Base

  def process_url(url) do
    "https://api.datamuse.com/" <> url
  end

  def process_response_body(body) do
    body |> Jason.decode!()
  end
end
