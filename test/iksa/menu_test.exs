defmodule Iksa.MenuTest do
  use Iksa.DataCase

  alias Iksa.Menu

  describe "links" do
    alias Iksa.Menu.Link

    import Iksa.MenuFixtures

    @invalid_attrs %{order: nil, title: nil, url: nil}

    test "list_links/0 returns all links" do
      link = link_fixture()
      assert Menu.list_links() == [link]
    end

    test "get_link!/1 returns the link with given id" do
      link = link_fixture()
      assert Menu.get_link!(link.id) == link
    end

    test "create_link/1 with valid data creates a link" do
      valid_attrs = %{order: 42, title: "some title", url: "some url"}

      assert {:ok, %Link{} = link} = Menu.create_link(valid_attrs)
      assert link.order == 42
      assert link.title == "some title"
      assert link.url == "some url"
    end

    test "create_link/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Menu.create_link(@invalid_attrs)
    end

    test "update_link/2 with valid data updates the link" do
      link = link_fixture()
      update_attrs = %{order: 43, title: "some updated title", url: "some updated url"}

      assert {:ok, %Link{} = link} = Menu.update_link(link, update_attrs)
      assert link.order == 43
      assert link.title == "some updated title"
      assert link.url == "some updated url"
    end

    test "update_link/2 with invalid data returns error changeset" do
      link = link_fixture()
      assert {:error, %Ecto.Changeset{}} = Menu.update_link(link, @invalid_attrs)
      assert link == Menu.get_link!(link.id)
    end

    test "delete_link/1 deletes the link" do
      link = link_fixture()
      assert {:ok, %Link{}} = Menu.delete_link(link)
      assert_raise Ecto.NoResultsError, fn -> Menu.get_link!(link.id) end
    end

    test "change_link/1 returns a link changeset" do
      link = link_fixture()
      assert %Ecto.Changeset{} = Menu.change_link(link)
    end
  end

  describe "sublinks" do
    alias Iksa.Menu.Sublink

    import Iksa.MenuFixtures

    @invalid_attrs %{order: nil, title: nil, url: nil}

    test "list_sublinks/0 returns all sublinks" do
      sublink = sublink_fixture()
      assert Menu.list_sublinks() == [sublink]
    end

    test "get_sublink!/1 returns the sublink with given id" do
      sublink = sublink_fixture()
      assert Menu.get_sublink!(sublink.id) == sublink
    end

    test "create_sublink/1 with valid data creates a sublink" do
      valid_attrs = %{order: 42, title: "some title", url: "some url"}

      assert {:ok, %Sublink{} = sublink} = Menu.create_sublink(valid_attrs)
      assert sublink.order == 42
      assert sublink.title == "some title"
      assert sublink.url == "some url"
    end

    test "create_sublink/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Menu.create_sublink(@invalid_attrs)
    end

    test "update_sublink/2 with valid data updates the sublink" do
      sublink = sublink_fixture()
      update_attrs = %{order: 43, title: "some updated title", url: "some updated url"}

      assert {:ok, %Sublink{} = sublink} = Menu.update_sublink(sublink, update_attrs)
      assert sublink.order == 43
      assert sublink.title == "some updated title"
      assert sublink.url == "some updated url"
    end

    test "update_sublink/2 with invalid data returns error changeset" do
      sublink = sublink_fixture()
      assert {:error, %Ecto.Changeset{}} = Menu.update_sublink(sublink, @invalid_attrs)
      assert sublink == Menu.get_sublink!(sublink.id)
    end

    test "delete_sublink/1 deletes the sublink" do
      sublink = sublink_fixture()
      assert {:ok, %Sublink{}} = Menu.delete_sublink(sublink)
      assert_raise Ecto.NoResultsError, fn -> Menu.get_sublink!(sublink.id) end
    end

    test "change_sublink/1 returns a sublink changeset" do
      sublink = sublink_fixture()
      assert %Ecto.Changeset{} = Menu.change_sublink(sublink)
    end
  end
end
