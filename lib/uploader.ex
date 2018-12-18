defmodule Filex.Uploader do
  @default_expiration "1w"
  @api_url Application.get_env(:filex, :api_url)

  def upload(file_path), do: upload(@default_expiration, file_path)

  def upload(expiration, file_path) do
    expiration
    |> build_request_url()
    |> do_upload(file_path)
  end

  defp do_upload(request_url, file_path) do
    response =
      HTTPoison.post(
        request_url,
        {:multipart,
         [
           {:file, file_path,
            {"form-data", [{:name, "file"}, {:filename, Path.basename(file_path)}]}, []}
         ]}
      )

    case response do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> {:ok, body}
      {:error, %{reason: :enoent}} -> {:error, "File not found"}
      {:error, %{reason: reason}} -> {:error, reason}
    end
  end

  defp build_request_url(expiration), do: "#{@api_url}?expires=#{expiration}"
end
