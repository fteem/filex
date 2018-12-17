defmodule Filex.TimeMapperTest do
  use ExUnit.Case
  doctest Filex.TimeMapper

  import Filex.TimeMapper, only: [map: 2]

  test "returns only the amount when period is days" do
    assert map(1, :day) == "1"
  end

  test "appends 'w' to the amount when period is week" do
    assert map(5, :week) == "5w"
  end

  test "appends 'm' to the amount when period is month" do
    assert map(3, :month) == "3m"
  end

  test "appends 'y' to the amount when period is year" do
    assert map(7, :year) == "7y"
  end

  test "returns only the amount when period is anything else" do
    assert map(1, :foo) == "1"
  end
end
