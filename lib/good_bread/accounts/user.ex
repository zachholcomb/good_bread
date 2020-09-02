defmodule GoodBread.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :address, :string
    has_one :subscriptions, GoodBread.Accounts.Subscription
    has_many :shipments, GoodBread.Orders.Shipment

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :address])
    |> unique_constraint(:email)
    |> validate_required([:name, :email, :address])
    |> cast_assoc(:shipments)
    |> cast_assoc(:subscriptions)
  end
end
