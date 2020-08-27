defmodule GoodBread.Accounts.UsersTest do
  use GoodBread.DataCase

  alias GoodBread.Accounts

  describe "users" do
    alias GoodBread.Accounts.User

    @valid_attrs %{name: "Zach Holcomb", email: "byrdlike@gmail.com", address: "900 E. 8th Ave."}
    @update_attrs %{name: "Zerch Holcomb", email: "zach@example.com", address: "594 Hunter St."}
    @invalid_attrs %{name: nil, email: nil, address: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user

      user
    end

    test "user can be created with valid attributes" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "byrdlike@gmail.com"
      assert user.name == "Zach Holcomb"
      assert user.address == "900 E. 8th Ave."
    end

    test "user cannot be create with invalid attributes" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "user email is unique" do
      user = user_fixture(@valid_attrs)
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@valid_attrs)
    end

    test "list all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get a single user" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "update a user with valid attrs" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.name == "Zerch Holcomb"
      assert user.email == "zach@example.com"
      assert user.address == "594 Hunter St."
    end

    test "update a user cannot update user with invalid attrs" do
       user = user_fixture()
       assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
       assert user.name == "Zach Holcomb"
    end

    test "delete a user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change user returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
