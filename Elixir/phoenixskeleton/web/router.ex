defmodule Phoenixskeleton.Router do
  use Phoenixskeleton.Web, :router

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

  scope "/", Phoenixskeleton do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", Phoenixskeleton do
    pipe_through :api

    resources "/image", ImageController
    # resources "/doc", DocsController, except: [:new, :edit]
    # resources "/asset", AssetsController, except: [:new, :edit]
  end
end
