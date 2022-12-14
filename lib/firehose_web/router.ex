defmodule FirehoseWeb.Router do
  use FirehoseWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {FirehoseWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FirehoseWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # LJR: Uncommented the gen'd code below.
  scope "/api", FirehoseWeb do
    pipe_through :api
    get "/roll", RollController, :index # Added this route
    get "/roll/:num_dice", RollController, :show
    get "/datetime", DatetimeController, :show
    get "/freelist", FreelistController, :freelist_index
    get "/catfacts", FreelistController, :catfacts_index
    get "/coindesk", FreelistController, :coindesk_index
    get "/agify/:name", FreelistController, :agify_index
    get "/joke", FreelistController, :joke_show
    get "/rnduser", FreelistController, :rnd_user
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: FirehoseWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
