defmodule Phoenixskeleton.DocsControllerTest do
  use Phoenixskeleton.ConnCase

  alias Phoenixskeleton.Docs
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, docs_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    docs = Repo.insert! %Docs{}
    conn = get conn, docs_path(conn, :show, docs)
    assert json_response(conn, 200)["data"] == %{"id" => docs.id,
      "name" => docs.name}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, docs_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, docs_path(conn, :create), docs: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Docs, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, docs_path(conn, :create), docs: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    docs = Repo.insert! %Docs{}
    conn = put conn, docs_path(conn, :update, docs), docs: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Docs, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    docs = Repo.insert! %Docs{}
    conn = put conn, docs_path(conn, :update, docs), docs: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    docs = Repo.insert! %Docs{}
    conn = delete conn, docs_path(conn, :delete, docs)
    assert response(conn, 204)
    refute Repo.get(Docs, docs.id)
  end
end
