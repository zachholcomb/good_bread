defmodule GoodBread.Items.ItemsTest do
  use GoodBread.DataCase

  alias GoodBread.Items

  describe "items" do
    alias GoodBread.Items.Item

    @valid_attrs %{name: "Sourdough Loaf", price: 7.50}
    @update_attrs %{name: "Croissant", price: 4.50}
    @invalid_attrs %{name: nil, price: nil}

    def item_fixtures(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Items.create_item

      item
    end

    test "item can be create with valid attributes" do
      assert {:ok, %Item{} = item} = Items.create_item(@valid_attrs)
      assert item.name == "Sourdough Loaf"
      assert item.price == 7.50
    end
  end
end
