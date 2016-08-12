defmodule Phoenixskeleton.PageController do
  use Phoenixskeleton.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
