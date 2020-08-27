defmodule GoodBread.Repo.Migrations.CreateSubscriptions do
  use Ecto.Migration

  def change do
    create table(:subscriptions) do
      add :type, :string
      add :user_id, references(:users)

      timestamps()
    end
  end
end
