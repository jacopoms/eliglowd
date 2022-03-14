defmodule Eliglowd.GuardianApi do

  alias Eliglowd.GuardianApi.Article, as: Article
  alias Eliglowd.GuardianApi.Client, as: Client

   def start do
    Client.start
  end

  def search(query) do
    make_request("search?q=#{query}")
  end

  def fetch_article_by_id(id) do
    make_request(id)
  end


  def make_request(str) do
    case Client.get!(str) do
      %HTTPoison.Response{status_code: 200, body: body} ->
        body
      %HTTPoison.Response{status_code: 404} ->
        IO.puts "Not found :("
      %HTTPoison.Error{reason: reason} ->
        IO.inspect reason
    end
  end

  defp format_article(article) do

  end
end
