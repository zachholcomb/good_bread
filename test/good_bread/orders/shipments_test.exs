defmodule GoodBread.Orders.ShipmentTest do
  use GoodBread.DataCase

  alias GoodBread.Orders
  alias GoodBread.Accounts
  alias GoodBread.Items

  describe "orders" do
    alias GoodBread.Orders.Shipment

    @item_attrs %{name: "Sourdough Loaf", price: 7.50}
    @user_attrs %{name: "Zach Holcomb", email: "byrdlike@gmail.com", address: "900 E. 8th Ave."}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@item_attrs)
        |> Items.create_item

      item
    end

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@user_attrs)
        |> Accounts.create_user

      user
    end

    def subscription_fixture(user) do
      attrs = %{user: user}
      {:ok, subscription} =
        attrs
        |> Enum.into(attrs)
        |> Accounts.create_subscription()

      subscription
    end

    def shipment_fixture(subscription, user) do
      attrs = %{subscription: subscription,
                user: user,
                status: "shipped",
                delivery_date: "8/28/2020"
              }
      {:ok, shipment} =
        attrs
        |> Enum.into(attrs)
        |> Orders.create_shipment()

    end

    test "user with a subscription can have orders" do
      user = user_fixture()
      subscription = subscription_fixture(user)
      shipment = shipment_fixture(subscription, user)

    end
  end
end
