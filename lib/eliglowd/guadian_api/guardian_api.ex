defmodule Eliglowd.GuardianApi do
  import HTTPoison

  alias Eliglowd.GuardianApi.Article, as: Article

  @base_url "http://content.guardianapis.com/"

  def fetch_articles do
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

  def fetch_article do
    %Article{
      title: "some Title",
      subtitle: "Article",
      html_text: "some html text"
    }
  end
end
