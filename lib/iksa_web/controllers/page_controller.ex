defmodule IksaWeb.PageController do
  use IksaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
