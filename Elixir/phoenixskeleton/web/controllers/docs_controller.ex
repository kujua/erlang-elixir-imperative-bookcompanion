# defmodule Phoenixskeleton.DocsController do
#   use Phoenixskeleton.Web, :controller
#
#   alias Phoenixskeleton.Docs
#
#   def index(conn, _params) do
#     doc = Repo.all(Docs)
#     render(conn, "index.json", doc: doc)
#   end
#
#   def create(conn, %{"docs" => docs_params}) do
#     changeset = Docs.changeset(%Docs{}, docs_params)
#
#     case Repo.insert(changeset) do
#       {:ok, docs} ->
#         conn
#         |> put_status(:created)
#         |> put_resp_header("location", docs_path(conn, :show, docs))
#         |> render("show.json", docs: docs)
#       {:error, changeset} ->
#         conn
#         |> put_status(:unprocessable_entity)
#         |> render(Phoenixskeleton.ChangesetView, "error.json", changeset: changeset)
#     end
#   end
#
#   def show(conn, %{"id" => id}) do
#     docs = Repo.get!(Docs, id)
#     render(conn, "show.json", docs: docs)
#   end
#
#   def update(conn, %{"id" => id, "docs" => docs_params}) do
#     docs = Repo.get!(Docs, id)
#     changeset = Docs.changeset(docs, docs_params)
#
#     case Repo.update(changeset) do
#       {:ok, docs} ->
#         render(conn, "show.json", docs: docs)
#       {:error, changeset} ->
#         conn
#         |> put_status(:unprocessable_entity)
#         |> render(Phoenixskeleton.ChangesetView, "error.json", changeset: changeset)
#     end
#   end
#
#   def delete(conn, %{"id" => id}) do
#     docs = Repo.get!(Docs, id)
#
#     # Here we use delete! (with a bang) because we expect
#     # it to always work (and if it does not, it will raise).
#     Repo.delete!(docs)
#
#     send_resp(conn, :no_content, "")
#   end
# end
