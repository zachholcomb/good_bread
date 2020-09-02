defmodule GoodBread.Accounts do
  import Ecto.Query, warn: false
  alias GoodBread.Repo
  alias GoodBread.Accounts.User
  alias GoodBread.Accounts.Subscription

  # USERS
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def list_users do
    Repo.all(User)
    |> Repo.preload(:subscriptions)
  end

  def get_user!(id) do
    Repo.get!(User, id)
    |> Repo.preload(:subscriptions)
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  # SUBSCRIPTIONS

  def create_subscription(attrs \\ %{}) do
    %Subscription{}
    |> Subscription.changeset(attrs)
    |> Repo.insert()
  end

  def list_subscriptions do
    Repo.all(Subscription)
    |> Repo.preload(:user)
  end

  def get_subscription!(id) do
    Repo.get!(Subscription, id)
  end

  def update_subscription(%Subscription{} = subscription, attrs) do
    subscription
    |> Subscription.changeset(attrs)
    |> Repo.update()
  end

  def delete_subscription(%Subscription{} = subscription) do
    Repo.delete(subscription)
  end
end
