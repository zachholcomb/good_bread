defmodule GoodBread.Accounts.SubscriptionsTest do
  use GoodBread.DataCase

  alias GoodBread.Accounts

  describe "subscriptions" do
    alias GoodBread.Accounts.Subscription

    @user_attrs %{name: "Zach Holcomb", email: "byrdlike@gmail.com", address: "900 E. 8th Ave."}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.info(@user_attrs)
        |> Accounts.create_user

      user
    end

    test "user can create a subscription" do
      user = user_fixture()
      subscription_attrs = %{type: 0, user_id: user.id}
      assert {:ok, %Subscription = subscription} = Accounts.create_subscription(subscription_attrs)
      assert user.subscriptions == [subscription]
    end
  end
end
