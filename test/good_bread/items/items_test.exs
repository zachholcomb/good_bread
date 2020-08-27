defmodule GoodBread.Items.ItemsTest do
  use GoodBread.DataCase

  alias GoodBread.Items

  describe "items" do
    alias GoodBread.Items.Item

    @valid_attrs %{name: "Sourdough Loaf", price: 7.50}
    @update_attrs %{name: "Croissant", price: 4.50}
    @invalid_attrs %{name: nil, price: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Items.create_item

      item
    end

    test "item can be created with valid attributes" do
      assert {:ok, %Item{} = item} = Items.create_item(@valid_attrs)
      assert item.name == "Sourdough Loaf"
      assert item.price == 7.50
    end

    test "item cannot be created with invalid attributes" do
      assert {:error, %Ecto.Changeset{}} = Items.create_item(@invalid_attrs)
    end

    test "list all items" do
      item = item_fixture()
      assert Items.list_items() == [item]
    end

    test "show one item by id" do
      item = item_fixture()
      assert Items.get_item!(item.id) == item
    end

    test "update item with valid attrs" do
      item = item_fixture()
      assert {:ok, %Item{} = item} = Items.update_item(item, @update_attrs)
      assert item.name == "Croissant"
      assert item.price == 4.50
    end

    test "cannot update item with invalid attrs" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Items.update_item(item, @invalid_attrs)
      assert item.name == "Sourdough Loaf"
    end

    test "delete an item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Items.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Items.get_item!(item.id) end
    end

    test "change item return a changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Items.change_item(item)
    end
  end
end
