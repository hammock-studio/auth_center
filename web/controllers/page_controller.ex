defmodule AuthCenter.PageController do
  use AuthCenter.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
