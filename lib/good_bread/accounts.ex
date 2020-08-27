defmodule GoodBread.Accounts do
  import Ecto.Query, warn: false
  alias GoodBread.Repo
  alias GoodBread.Accounts.User

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end
