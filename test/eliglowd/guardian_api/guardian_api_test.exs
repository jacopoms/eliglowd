defmodule Eliglowd.GuardianApiTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock

  alias Eliglowd.GuardianApi
  alias Eliglowd.GuardianApi.Article

  setup do
    ExVCR.Config.cassette_library_dir("fixture/vcr_cassettes")
    GuardianApi.start
    :ok
  end

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
    ] = GuardianApi.search("foobar")
  end

  test "fetch no Article single article"do
    assert %Article{
        title: "some Title",
        subtitle: "Article",
        html_text: "some html text"
      } = GuardianApi.fetch_article_by_id("test")
  end
end
