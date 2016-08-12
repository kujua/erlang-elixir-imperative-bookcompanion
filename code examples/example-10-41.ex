defmodule DarApi.Router do
  use DarApi.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DarApi do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index
  end

  scope "/api", DarApi do
    pipe_through :api
    resources "/assets", ApiController, except: [:new, :edit, :update, :delete]
    get "/assets/:id/text", ApiController, :get_text_for_id
    get "/assets/:id/images", ApiController, :get_images_for_id
    post "/assets/:id/text/:textid", ApiController, :update_text_for_id
    post "/assets/:id/image/:imageid", ApiController, :update_image_for_id
    post "/assets/:id/text", ApiController, :post_text_for_id
    post "/assets/:id/image", ApiController, :post_image_for_id
    get "/assets/:id/document", ApiController, :get_document_for_id
  end
end
