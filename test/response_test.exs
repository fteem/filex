defmodule Filex.ResponseTest do
  use ExUnit.Case
  doctest Filex.Response

  import Filex.Response, only: [parse: 1]

  test "returns URL and expiry when presented with tuple representing success" do
    body = "{\"link\":\"https://file.io/JV2RLc\",\"expiry\":\"7 days\"}"

    assert parse({:ok, body}) == {
             :ok,
             [url: "https://file.io/JV2RLc", expires: "7 days"]
           }
  end

  test "returns error when presented with tuple representing error" do
    assert parse({:error, 'foo'}) == {:error, 'foo'}
  end
end
