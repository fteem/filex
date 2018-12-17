defmodule Filex.TimeMapper do
  def map(amount, :week), do: "#{amount}w"
  def map(amount, :month), do: "#{amount}m"
  def map(amount, :year), do: "#{amount}y"
  def map(amount, _), do: to_string(amount)
end
