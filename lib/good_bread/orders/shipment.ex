defmodule GoodBread.Orders.Shipment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shipments" do
    field :status, :string
    field :delivery_date, :string
    belongs_to :subscription, GoodBread.Accounts.Subscription
    belongs_to :user, GoodBread.Accounts.User

    timestamps()
  end

  def changeset(shipment, attrs) do
    shipment
    |> cast(attrs, [:status, :delivery_date])
    |> validate_required([:status, :delivery_date])
    |> put_assoc(:user, attrs.user)
    |> put_assoc(:subscription, attrs.subscription)
  end
end
