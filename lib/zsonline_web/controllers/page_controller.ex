defmodule ZsonlineWeb.PageController do
  use ZsonlineWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
