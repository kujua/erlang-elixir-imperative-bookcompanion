defmodule DarApi.PageController do
  use DarApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
