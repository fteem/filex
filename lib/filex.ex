defmodule Filex do
  @moduledoc """
  Filex is a library that wraps file.io's API in an Elixir module. Allows
  uploading files with configurable expiration time (days, weeks, months, years).

  Functions available in `Filex`:
  - `Filex.upload/1`
  - `Filex.upload/3`
  """

  @doc """
  Takes `file_path`, `amount` and `period` as arguments and uploads the file
  via file.io's API.

  Returns a one-time link to the uploaded file and expiry time.

  ## Examples

      Filex.upload("test/fixtures/image.png", 2, :month)
      { :ok, [url: "https://file.io/aQbnDJ", expires: "60 days"]}

      Filex.upload("nonexistent.png")
      { :error, "File not found" }

  """
  def upload(file_path, amount, period) do
    Filex.TimeMapper.map(amount, period)
    |> Filex.Uploader.upload(file_path)
    |> Filex.Response.parse()
  end

  @doc """
  Helper function for `Filex.upload/3`, defaulting `amount` and `period`
  to 1 week (7 days).

  ## Examples

      Filex.upload("test/fixtures/image.png")
      { :ok, [url: "https://file.io/aQbnDJ", expires: "7 days"]}

  """
  def upload(file_path) do
    file_path
    |> Filex.Uploader.upload()
    |> Filex.Response.parse()
  end
end
