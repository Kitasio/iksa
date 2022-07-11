defmodule IksaWeb.SublinkControllerTest do
  use IksaWeb.ConnCase

  import Iksa.MenuFixtures

  @create_attrs %{order: 42, title: "some title", url: "some url"}
  @update_attrs %{order: 43, title: "some updated title", url: "some updated url"}
  @invalid_attrs %{order: nil, title: nil, url: nil}

  describe "index" do
    test "lists all sublinks", %{conn: conn} do
      conn = get(conn, Routes.sublink_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Sublinks"
    end
  end

  describe "new sublink" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.sublink_path(conn, :new))
      assert html_response(conn, 200) =~ "New Sublink"
    end
  end

  describe "create sublink" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sublink_path(conn, :create), sublink: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.sublink_path(conn, :show, id)

      conn = get(conn, Routes.sublink_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Sublink"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sublink_path(conn, :create), sublink: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Sublink"
    end
  end

  describe "edit sublink" do
    setup [:create_sublink]

    test "renders form for editing chosen sublink", %{conn: conn, sublink: sublink} do
      conn = get(conn, Routes.sublink_path(conn, :edit, sublink))
      assert html_response(conn, 200) =~ "Edit Sublink"
    end
  end

  describe "update sublink" do
    setup [:create_sublink]

    test "redirects when data is valid", %{conn: conn, sublink: sublink} do
      conn = put(conn, Routes.sublink_path(conn, :update, sublink), sublink: @update_attrs)
      assert redirected_to(conn) == Routes.sublink_path(conn, :show, sublink)

      conn = get(conn, Routes.sublink_path(conn, :show, sublink))
      assert html_response(conn, 200) =~ "some updated title"
    end

    test "renders errors when data is invalid", %{conn: conn, sublink: sublink} do
      conn = put(conn, Routes.sublink_path(conn, :update, sublink), sublink: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Sublink"
    end
  end

  describe "delete sublink" do
    setup [:create_sublink]

    test "deletes chosen sublink", %{conn: conn, sublink: sublink} do
      conn = delete(conn, Routes.sublink_path(conn, :delete, sublink))
      assert redirected_to(conn) == Routes.sublink_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.sublink_path(conn, :show, sublink))
      end
    end
  end

  defp create_sublink(_) do
    sublink = sublink_fixture()
    %{sublink: sublink}
  end
end
