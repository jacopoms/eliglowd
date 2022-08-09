defmodule Eliglowd.GuardianApi do

  alias Eliglowd.GuardianApi.Article, as: Article
  alias Eliglowd.GuardianApi.Client, as: Client

  def start do
    Client.start
  end

  def search(query) do
    Client.make_request("search?q=#{query}")
  end

  def fetch_article_by_id(id) do
    Client.make_request(id)
  end

  defp format_article(article) do

  end
end
