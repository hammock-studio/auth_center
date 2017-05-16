defmodule AuthCenter.UserView do
  use AuthCenter.Web, :view
  alias AuthCenter.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
