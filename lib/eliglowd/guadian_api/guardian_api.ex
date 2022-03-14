defmodule Eliglowd.GuardianApi do

  alias Eliglowd.GuardianApi.Article, as: Article
  alias Eliglowd.GuardianApi.Client, as: Client

  def search(query) do
    [
      %Article{
        title: "some Title",
        subtitle: "Article",
        html_text: "some html text"
      },
      %Article{
        title: "some Title 2",
        subtitle: "Article 3",
        html_text: "some html text 2"
      }
    ]
  end

  def fetch_article_by_id(id) do
    if id do
      %Article{
        title: "some Title",
        subtitle: "Article",
        html_text: "some html text"
      }
    end
  end
end
