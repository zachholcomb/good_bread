defmodule GoodBread.Repo.Migrations.CreateShipmentsTable do
  use Ecto.Migration

  def change do
    create table(:shipments) do
      add :status, :string
      add :delivery_date, :string
      add :user_id, references(:users)
      add :subscription_id, references(:subscriptions)

      timestamps()
    end
  end
end
