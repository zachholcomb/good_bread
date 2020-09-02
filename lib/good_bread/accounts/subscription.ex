defmodule GoodBread.Accounts.Subscription do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subscriptions" do
    field :type, :string, default: "Weekly"
    belongs_to :user, GoodBread.Accounts.User
    has_many :shipments, GoodBread.Orders.Shipment

    timestamps()
  end

  @doc false
  def changeset(subscription, attrs) do
    subscription
    |> cast(attrs, [:type])
    |> validate_required([:type])
    |> put_assoc(:user, attrs.user)
  end
end
