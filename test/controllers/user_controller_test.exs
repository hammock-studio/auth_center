defmodule AuthCenter.UserControllerTest do
  use AuthCenter.ConnCase, async: true

  test "register new user", %{conn: conn} do
    user_data = %{
      "user" => %{
        "email" => "new@gmail.com",
        "name" => "tal new",
        "password" => "newnewnewnew",
        "username" => "tal123new"
      }
    }

    conn = post(conn, user_path(conn, :create), user_data)
    assert html_response(conn, 302)
  end
end
