defmodule GoodBread.Repo.Migrations.AddsUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :address, :string

      timestamps()
    end
  end
end
