defmodule Eliglowd.GuardianApiTest do
  use ExUnit.Case
  alias Eliglowd.GuardianApi
  alias Eliglowd.GuardianApi.Article

  test "fetch correctly a list of articles"  do
    assert [
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
    ] = GuardianApi.fetch_articles
  end

  test "fetch one single article"do
    assert [
      %Article{
        title: "some Title",
        subtitle: "Article",
        html_text: "some html text"
      }
    ] = GuardianApi.fetch_article
  end
end
