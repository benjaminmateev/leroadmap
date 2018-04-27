defmodule LeroadmapWeb.Router do
  use LeroadmapWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", LeroadmapWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  scope "/", LeroadmapWeb do
    pipe_through(:api)
    resources "/projects", ProjectController do
      resources "/features", FeatureController, only: [:index, :create]
    end
    resources "/features", FeatureController, only: [:show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", LeroadmapWeb do
  #   pipe_through :api
  # end
end
