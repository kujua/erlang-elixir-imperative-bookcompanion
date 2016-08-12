defmodule Phoenixskeleton.AssetsView do
  use Phoenixskeleton.Web, :view

  def render("index.json", %{asset: asset}) do
    %{data: render_many(asset, Phoenixskeleton.AssetsView, "assets.json")}
  end

  def render("show.json", %{assets: assets}) do
    %{data: render_one(assets, Phoenixskeleton.AssetsView, "assets.json")}
  end

  def render("assets.json", %{assets: assets}) do
    %{id: assets.id,
      name: assets.name,
      gfsid: assets.gfsid}
  end
end
