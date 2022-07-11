defmodule IksaWeb.LinkController do
  use IksaWeb, :controller

  alias Iksa.Menu
  alias Iksa.Menu.Link
  alias Iksa.Locale
  alias Iksa.Repo

  def index(conn, _params) do
    links = Menu.list_links()
    render(conn, "index.html", links: links)
  end

  def new(conn, _params) do
    changeset = Menu.change_link(%Link{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"link" => link_params}) do
    case Menu.create_link(link_params) do
      {:ok, link} ->
        conn
        |> put_flash(:info, "Link created successfully.")
        |> redirect(to: Routes.link_path(conn, :show, link))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    link = Menu.get_link!(id) |> Repo.preload(:sublinks)
    language = Locale.get_language!(link.lang_id)
    render(conn, "show.html", link: link, language: language)
  end

  def edit(conn, %{"id" => id}) do
    link = Menu.get_link!(id)
    changeset = Menu.change_link(link)
    render(conn, "edit.html", link: link, changeset: changeset)
  end

  def update(conn, %{"id" => id, "link" => link_params}) do
    link = Menu.get_link!(id)

    case Menu.update_link(link, link_params) do
      {:ok, link} ->
        conn
        |> put_flash(:info, "Link updated successfully.")
        |> redirect(to: Routes.link_path(conn, :show, link))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", link: link, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    link = Menu.get_link!(id)
    {:ok, _link} = Menu.delete_link(link)

    conn
    |> put_flash(:info, "Link deleted successfully.")
    |> redirect(to: Routes.link_path(conn, :index))
  end
end
