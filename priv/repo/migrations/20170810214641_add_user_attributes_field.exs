defmodule AuthCenter.Repo.Migrations.AddUserAttributesField do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :data, :map
    end
  end
end
