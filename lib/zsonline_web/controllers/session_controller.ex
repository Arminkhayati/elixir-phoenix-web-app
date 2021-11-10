defmodule ZsonlineWeb.SessionController do
  use ZsonlineWeb, :controller
  alias Zsonline.Acounts


  def new(conn, _)do
    render(conn, "new.html")
  end

  def create(conn, %{"user" => %{"email" => email, "password" => password} })do
    case Acounts.authenticate_by_email_password(email, password) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome Back")
        |> put_session(:user_id, user.id)
        |> configure_session(renew: true)
        |> redirect(to: "/")
      {:error, :unauthorized} ->
        conn
        |> put_flash(:error, "Bad email/password combination")
        |> redirect(to: Routes.session_path(conn, :new))
    end
  end

  def delete(conn, _)do
    conn
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end

end
