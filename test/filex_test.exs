defmodule FilexTest do
  use ExUnit.Case
  doctest Filex

  test "greets the world" do
    assert Filex.hello() == :world
  end
end
