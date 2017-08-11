defmodule AuthCenter.UserController do
  use AuthCenter.Web, :controller
  alias AuthCenter.User

  plug :authenticate_user when action in [:index, :show]

  def index(conn, _params) do
    users = Repo.all(AuthCenter.User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(AuthCenter.User, id)
    render conn, "show.html", user: user
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.registration_changeset(%User{}, user_params)
    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> AuthCenter.Auth.login(user)
        |> put_flash(:info, "#{user.name} created!")
        |> redirect(to: user_path(conn, :index))
        {:error, changeset} ->
          render(conn, "new.html", changeset: changeset)
    end
  end

  def confirmed_email(conn, whatever) do

  end

  def console_print(conn, %{"you_say" => you_say}) do
    Email.welcome_html_email("hammock.studio.acc@gmail.com", you_say)
    |> AuthCenter.Mailer.deliver_now

    IO.puts("what ever: #{you_say}")

    json conn, %{email_sent: true, to: you_say}
  end
end
