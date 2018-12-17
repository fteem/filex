defmodule Filex.Response do
  def parse({ :ok, body }) do
    body
    |> Poison.decode!(%{keys: :atoms})
    |> handle_response()
  end
  def parse({ :error, message }), do: { :error, message }

  defp handle_response(%{ link: link, expiry: expiry }) do
    { :ok, [url: link, expires: expiry] }
  end
end
