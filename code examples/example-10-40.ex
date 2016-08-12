defmodule DarApi.ApiController do
  use DarApi.Web, :controller

  def index(conn, params) do
    {:response, {:request, msg}} = DARRouter.process_message(DARRouter, {:get_assets_all, params})
    render conn, response: msg
  end
end
