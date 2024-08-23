defmodule NobleBackendWeb.Router do
  use NobleBackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug CORSPlug
  end

  pipeline :auth do
    plug NobleBackendWeb.Auth
  end

  scope "/api", NobleBackendWeb do
    pipe_through :api
    post "/clients", ClientController, :create
    get "/products", ProductController, :show_all
    post "/login", ClientController, :login
  end

  scope "/api", NobleBackendWeb do
    pipe_through [:api, :auth]
    resources "/orders", OrderController, only: [:create, :show, :update, :delete]
    resources "/payments", PaymentController, only: [:create, :show, :update, :delete]
    resources "/order-items", OrderItemController, only: [:create, :show, :update, :delete]
    resources "/products", ProductController, only: [:create, :show, :update, :delete]
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:noble_backend, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: NobleBackendWeb.Telemetry
    end
  end
end
