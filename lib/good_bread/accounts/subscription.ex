defmodule GoodBread.Accounts.Subscription do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subscriptions" do
    field :type, :string
    belongs_to :user_id, GoodBread.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(subscription, attrs) do
    subscription
    |> cast(attrs, [:type, :user_id])
    |> validate_required([:type, :user_id])
  end
end
