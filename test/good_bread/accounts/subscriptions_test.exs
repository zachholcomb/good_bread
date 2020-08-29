defmodule GoodBread.Accounts.SubscriptionsTest do
  use GoodBread.DataCase

  alias GoodBread.Accounts

  describe "subscriptions" do
    alias GoodBread.Accounts.Subscription

    @user_attrs %{name: "Zach Holcomb", email: "byrdlike@gmail.com", address: "900 E. 8th Ave."}
    @invalid_attrs %{type: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@user_attrs)
        |> Accounts.create_user

      user
    end

    def subscription_fixture(attrs \\ %{}) do
      {:ok, subscription} =
        attrs
        |> Enum.into(attrs)
        |> Accounts.create_subscription()

      subscription
    end

    test "user can create a subscription" do
      user = user_fixture()
      subscription_attrs = %{type: "Monthly", user: user}
      assert {:ok, %Subscription{} = subscription} = Accounts.create_subscription(subscription_attrs)
      assert user == subscription.user

      user = Accounts.get_user!(user.id)
      subscription = Accounts.get_subscription!(subscription.id)
      assert user.subscriptions == subscription
    end

    test "subscriptions type default value" do
      user = user_fixture()
      subscription_attrs = %{user: user}
      assert {:ok, %Subscription{} = subscription} = Accounts.create_subscription(subscription_attrs)
      assert subscription.type == "Weekly"
    end

    test "subscriptions can be updated" do
      user = user_fixture()
      attrs = %{user: user}
      subscription = subscription_fixture(attrs)
      update_attrs = %{type: "Bi-Monthly", user: user}
      assert {:ok, %Subscription{} = subscription} = Accounts.update_subscription(subscription, update_attrs)
    end

    test "get all subscriptions" do
      user = user_fixture()
      subscription_attrs = %{user: user}
      subscription = subscription_fixture(subscription_attrs)
      assert Accounts.list_subscriptions() == [subscription]
    end
  end
end
