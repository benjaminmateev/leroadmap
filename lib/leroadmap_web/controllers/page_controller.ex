defmodule LeroadmapWeb.PageController do
  use LeroadmapWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
