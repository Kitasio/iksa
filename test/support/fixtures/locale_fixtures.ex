defmodule Iksa.LocaleFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Iksa.Locale` context.
  """

  @doc """
  Generate a language.
  """
  def language_fixture(attrs \\ %{}) do
    {:ok, language} =
      attrs
      |> Enum.into(%{
        lang: "some lang"
      })
      |> Iksa.Locale.create_language()

    language
  end
end
