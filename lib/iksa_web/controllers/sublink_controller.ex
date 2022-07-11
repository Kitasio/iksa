defmodule IksaWeb.SublinkController do
  use IksaWeb, :controller

  alias Iksa.Menu
  alias Iksa.Menu.Sublink

  def index(conn, _params) do
    sublinks = Menu.list_sublinks()
    render(conn, "index.html", sublinks: sublinks)
  end

  def new(conn, _params) do
    changeset = Menu.change_sublink(%Sublink{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sublink" => sublink_params}) do
    case Menu.create_sublink(sublink_params) do
      {:ok, sublink} ->
        conn
        |> put_flash(:info, "Sublink created successfully.")
        |> redirect(to: Routes.sublink_path(conn, :show, sublink))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sublink = Menu.get_sublink!(id)
    render(conn, "show.html", sublink: sublink)
  end

  def edit(conn, %{"id" => id}) do
    sublink = Menu.get_sublink!(id)
    changeset = Menu.change_sublink(sublink)
    render(conn, "edit.html", sublink: sublink, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sublink" => sublink_params}) do
    sublink = Menu.get_sublink!(id)

    case Menu.update_sublink(sublink, sublink_params) do
      {:ok, sublink} ->
        conn
        |> put_flash(:info, "Sublink updated successfully.")
        |> redirect(to: Routes.sublink_path(conn, :show, sublink))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", sublink: sublink, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sublink = Menu.get_sublink!(id)
    {:ok, _sublink} = Menu.delete_sublink(sublink)

    conn
    |> put_flash(:info, "Sublink deleted successfully.")
    |> redirect(to: Routes.sublink_path(conn, :index))
  end
end
