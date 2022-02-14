defmodule EliglowdWeb.PageController do
  use EliglowdWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
