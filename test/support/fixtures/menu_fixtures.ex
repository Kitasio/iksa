defmodule Iksa.MenuFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Iksa.Menu` context.
  """

  @doc """
  Generate a link.
  """
  def link_fixture(attrs \\ %{}) do
    {:ok, link} =
      attrs
      |> Enum.into(%{
        order: 42,
        title: "some title",
        url: "some url"
      })
      |> Iksa.Menu.create_link()

    link
  end

  @doc """
  Generate a sublink.
  """
  def sublink_fixture(attrs \\ %{}) do
    {:ok, sublink} =
      attrs
      |> Enum.into(%{
        order: 42,
        title: "some title",
        url: "some url"
      })
      |> Iksa.Menu.create_sublink()

    sublink
  end
end
