defmodule Phoenixskeleton.ImageView do
  use Phoenixskeleton.Web, :view

  def render("index.json", %{images: images}) do
    %{data: render_many(images, Phoenixskeleton.ImageView, "image.json")}
  end

  def render("show.json", %{image: image}) do
    %{data: render_one(image, Phoenixskeleton.ImageView, "image.json")}
  end

  def render("image.json", %{image: image}) do
    %{id: image.id}
  end
end
