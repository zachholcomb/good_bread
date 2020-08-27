defmodule GoodBread.Items do
  import Ecto.Query, warn: false
  alias GoodBread.Repo
  alias GoodBread.Items.Item

  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changest(attrs)
    |> Repo.insert()
  end
end
