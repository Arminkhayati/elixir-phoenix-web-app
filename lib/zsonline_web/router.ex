defmodule ZsonlineWeb.Router do
  use ZsonlineWeb, :router

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

  scope "/", ZsonlineWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/users", UserController
    # We also used the singleton: true option, which defines all
    # the RESTful routes, but does not require a resource ID to be passed along
    # in the URL. We don’t need an ID in the URL because our actions are always
    # scoped to the “current” user in the system.
    # The ID is always in the session
    resources "/sessions", SessionController, only: [:new, :create, :delete], singleton: true
  end


  scope "/cms", ZsonlineWeb.CMS, as: :cms do
      pipe_through [:browser, :authenticate_user]
      resources "/pages", PageController

    end

  defp authenticate_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "Login required")
        |> Phoenix.Controller.redirect(to: "/")
        |> halt()
      user_id ->
        assign(conn, :current_user, Zsonline.Acounts.get_user!(user_id))
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", ZsonlineWeb do
  #   pipe_through :api
  # end
end
