defmodule Phoenixskeleton.DocsView do
  use Phoenixskeleton.Web, :view

  def render("index.json", %{doc: doc}) do
    %{data: render_many(doc, Phoenixskeleton.DocsView, "docs.json")}
  end

  def render("show.json", %{docs: docs}) do
    %{data: render_one(docs, Phoenixskeleton.DocsView, "docs.json")}
  end

  def render("docs.json", %{docs: docs}) do
    %{id: docs.id,
      name: docs.name}
  end
end
