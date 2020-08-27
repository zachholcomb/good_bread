defmodule GoodBread.Accounts.SubscriptionsTest do
  use GoodBread.DataCase

  alias GoodBread.Accounts

  describe "subscriptions" do
    alias GoodBread.Accounts.Subscription

    @user_attrs %{name: "Zach Holcomb", email: "byrdlike@gmail.com", address: "900 E. 8th Ave."}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@user_attrs)
        |> Accounts.create_user

      user
    end

    test "user can create a subscription" do
      user = user_fixture()
      subscription_attrs = %{type: "Monthly", user: user}
      assert {:ok, %Subscription{} = subscription} = Accounts.create_subscription(subscription_attrs)
      assert subscription.user == user
    end

    test "subscriptions type default value" do
      user = user_fixture()
      subscription_attrs = %{user: user}
      assert {:ok, %Subscription{} = subscription} = Accounts.create_subscription(subscription_attrs)
      assert subscription.type == "Weekly"
    end
  end
end
