defmodule Phoenixskeleton.AssetsControllerTest do
  use Phoenixskeleton.ConnCase

  alias Phoenixskeleton.Assets
  @valid_attrs %{gfsid: "some content", name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, assets_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    assets = Repo.insert! %Assets{}
    conn = get conn, assets_path(conn, :show, assets)
    assert json_response(conn, 200)["data"] == %{"id" => assets.id,
      "name" => assets.name,
      "gfsid" => assets.gfsid}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, assets_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, assets_path(conn, :create), assets: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Assets, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, assets_path(conn, :create), assets: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    assets = Repo.insert! %Assets{}
    conn = put conn, assets_path(conn, :update, assets), assets: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Assets, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    assets = Repo.insert! %Assets{}
    conn = put conn, assets_path(conn, :update, assets), assets: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    assets = Repo.insert! %Assets{}
    conn = delete conn, assets_path(conn, :delete, assets)
    assert response(conn, 204)
    refute Repo.get(Assets, assets.id)
  end
end
