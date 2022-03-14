defmodule Eliglowd.GuardianApi.Client do
  use HTTPoison.Base

  @base_url "http://content.guardianapis.com/"
  @api_key Application.get_env(:eliglowd, :api_key)

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
