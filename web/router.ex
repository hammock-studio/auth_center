defmodule AuthCenter.Router do
  use AuthCenter.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug AuthCenter.Auth, repo: AuthCenter.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AuthCenter do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  scope "/api", AuthCenter do
    pipe_through :api

    get "/test/:you_say", UserController, :console_print
  end

  # :authenticate_user is avilable.
  # scope "/need_to_authenticate_user", AuthCenter do
  #    pipe_through [:browser, :authenticate_user]
  # end

  # Other scopes may use custom stacks.
  # scope "/api", AuthCenter do
  #   pipe_through :api
  # end
end
