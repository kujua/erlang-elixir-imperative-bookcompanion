# defmodule Phoenixskeleton.AssetsController do
#   use Phoenixskeleton.Web, :controller
#
#   alias Phoenixskeleton.Assets
#
#   def index(conn, _params) do
#     asset = Repo.all(Assets)
#     render(conn, "index.json", asset: asset)
#   end
#
#   def create(conn, %{"assets" => assets_params}) do
#     changeset = Assets.changeset(%Assets{}, assets_params)
#
#     case Repo.insert(changeset) do
#       {:ok, assets} ->
#         conn
#         |> put_status(:created)
#         |> put_resp_header("location", assets_path(conn, :show, assets))
#         |> render("show.json", assets: assets)
#       {:error, changeset} ->
#         conn
#         |> put_status(:unprocessable_entity)
#         |> render(Phoenixskeleton.ChangesetView, "error.json", changeset: changeset)
#     end
#   end
#
#   def show(conn, %{"id" => id}) do
#     assets = Repo.get!(Assets, id)
#     render(conn, "show.json", assets: assets)
#   end
#
#   def update(conn, %{"id" => id, "assets" => assets_params}) do
#     assets = Repo.get!(Assets, id)
#     changeset = Assets.changeset(assets, assets_params)
#
#     case Repo.update(changeset) do
#       {:ok, assets} ->
#         render(conn, "show.json", assets: assets)
#       {:error, changeset} ->
#         conn
#         |> put_status(:unprocessable_entity)
#         |> render(Phoenixskeleton.ChangesetView, "error.json", changeset: changeset)
#     end
#   end
#
#   def delete(conn, %{"id" => id}) do
#     assets = Repo.get!(Assets, id)
#
#     # Here we use delete! (with a bang) because we expect
#     # it to always work (and if it does not, it will raise).
#     Repo.delete!(assets)
#
#     send_resp(conn, :no_content, "")
#   end
# end
