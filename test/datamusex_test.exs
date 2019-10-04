defmodule DatamusexTest do
  use ExUnit.Case

  alias Datamusex.{ParamList, Param}

  test "returns %Datamusex.ParamList{} struct" do
    assert %ParamList{params: [%Param{name: :similar_meaning, value: "computer"}]} =
             Datamusex.similar_meaning("computer")
  end
end
