defmodule Eliglowd.GuardianApi.Client do
  use HTTPoison.Base

  @base_url "http://content.guardianapis.com/"
  @api_key Application.get_env(:eliglowd, :api_key)


  def make_get_request(query) do
    case get(query) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        with %{"results" => results } <- elem(body, 1)
             {:ok, results}
        else
          body -> body
        end
      {:ok, %HTTPoison.Response{status_code: 403 }} ->
        IO.puts "Forbidden"
        {:error, :forbidden}
      {:ok, %HTTPoison.Response{status_code: 404 }} ->
        IO.puts "Not Found"
        {:error, :not_found}
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts "Error"
        IO.inspect(reason)
        {:error, reason }
    end
  end

  def process_request_url(url) do
    @base_url <> url
  end

  def process_request_headers(headers) do
    api_key()
    |> Enum.into(headers)
    |> Enum.into([])
  end

  def process_response_body(body) do
    body
    |> Jason.decode!
    |> Map.fetch("response")
  end


  defp api_key do
    [ "Api-Key": @api_key]
  end
end
