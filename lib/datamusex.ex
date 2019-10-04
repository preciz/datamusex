defmodule Datamusex do
  @moduledoc """
  Datamuse elixir wrapper
  """

  defmodule ParamList do
    @enforce_keys [:params]
    defstruct params: []
  end

  defmodule Param do
    @enforce_keys [:name, :value]
    defstruct [:name, :value]
  end

  [
    :similar_meaning,
    :sound_like,
    :spelled_similarly,
    :rhyme_with,
    :used_to_describe,
    :often_follow,
    :triggered_by,
    :synonyme
  ]
  |> Enum.each(fn name ->
    def unquote(name)(acc \\ %ParamList{params: []}, words) when is_binary(words) do
      %ParamList{
        params: [%Param{name: unquote(name), value: words |> process_words} | acc.params]
      }
    end
  end)

  def get_words(param_list = %ParamList{}, headers \\ [], options \\ []) do
    params_from_param_list = param_list |> param_list_to_httpoison_params

    options =
      options |> Keyword.update(:params, params_from_param_list, &(&1 ++ params_from_param_list))

    Datamusex.API.get(
      "words",
      headers,
      options
    )
  end

  def get_suggestions(words, headers \\ [], options \\ [])
      when is_binary(words) and is_list(headers) and is_list(options) do
    default_params = [s: process_words(words)]

    options = options |> Keyword.update(:params, default_params, &(&1 ++ default_params))

    Datamusex.API.get(
      "sug",
      headers,
      options
    )
  end

  defp process_words(words) when is_binary(words) do
    words
    |> String.split(" ")
    |> Enum.join("+")
  end

  defp param_list_to_httpoison_params(%ParamList{params: params}) do
    params |> Enum.map(&param_to_param_tuple/1)
  end

  defp param_to_param_tuple(%Param{name: name, value: value}) do
    tuple_name =
      case name do
        :similar_meaning -> :ml
        :sound_like -> :ml
        :spelled_similarly -> :sp
        :rhyme_with -> :rel_rhy
        :used_to_describe -> :rel_jjb
        :often_follow -> :lc
        :triggered_by -> :rel_trg
        :synonyme -> :rel_syn
      end

    {tuple_name, value}
  end
end
