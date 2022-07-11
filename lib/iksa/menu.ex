defmodule Iksa.Menu do
  @moduledoc """
  The Menu context.
  """

  import Ecto.Query, warn: false
  alias Iksa.Repo

  alias Iksa.Menu.Link

  @doc """
  Returns the list of links.

  ## Examples

      iex> list_links()
      [%Link{}, ...]

  """
  def list_links do
    Repo.all(Link)
  end

  @doc """
  Gets a single link.

  Raises `Ecto.NoResultsError` if the Link does not exist.

  ## Examples

      iex> get_link!(123)
      %Link{}

      iex> get_link!(456)
      ** (Ecto.NoResultsError)

  """
  def get_link!(id), do: Repo.get!(Link, id)

  @doc """
  Creates a link.

  ## Examples

      iex> create_link(%{field: value})
      {:ok, %Link{}}

      iex> create_link(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_link(attrs \\ %{}) do
    %Link{}
    |> Link.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a link.

  ## Examples

      iex> update_link(link, %{field: new_value})
      {:ok, %Link{}}

      iex> update_link(link, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_link(%Link{} = link, attrs) do
    link
    |> Link.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a link.

  ## Examples

      iex> delete_link(link)
      {:ok, %Link{}}

      iex> delete_link(link)
      {:error, %Ecto.Changeset{}}

  """
  def delete_link(%Link{} = link) do
    Repo.delete(link)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking link changes.

  ## Examples

      iex> change_link(link)
      %Ecto.Changeset{data: %Link{}}

  """
  def change_link(%Link{} = link, attrs \\ %{}) do
    Link.changeset(link, attrs)
  end

  alias Iksa.Menu.Sublink

  @doc """
  Returns the list of sublinks.

  ## Examples

      iex> list_sublinks()
      [%Sublink{}, ...]

  """
  def list_sublinks do
    Repo.all(Sublink)
  end

  @doc """
  Gets a single sublink.

  Raises `Ecto.NoResultsError` if the Sublink does not exist.

  ## Examples

      iex> get_sublink!(123)
      %Sublink{}

      iex> get_sublink!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sublink!(id), do: Repo.get!(Sublink, id)

  @doc """
  Creates a sublink.

  ## Examples

      iex> create_sublink(%{field: value})
      {:ok, %Sublink{}}

      iex> create_sublink(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sublink(attrs \\ %{}) do
    %Sublink{}
    |> Sublink.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sublink.

  ## Examples

      iex> update_sublink(sublink, %{field: new_value})
      {:ok, %Sublink{}}

      iex> update_sublink(sublink, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sublink(%Sublink{} = sublink, attrs) do
    sublink
    |> Sublink.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sublink.

  ## Examples

      iex> delete_sublink(sublink)
      {:ok, %Sublink{}}

      iex> delete_sublink(sublink)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sublink(%Sublink{} = sublink) do
    Repo.delete(sublink)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sublink changes.

  ## Examples

      iex> change_sublink(sublink)
      %Ecto.Changeset{data: %Sublink{}}

  """
  def change_sublink(%Sublink{} = sublink, attrs \\ %{}) do
    Sublink.changeset(sublink, attrs)
  end
end
