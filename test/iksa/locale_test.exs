defmodule Iksa.LocaleTest do
  use Iksa.DataCase

  alias Iksa.Locale

  describe "languages" do
    alias Iksa.Locale.Language

    import Iksa.LocaleFixtures

    @invalid_attrs %{lang: nil}

    test "list_languages/0 returns all languages" do
      language = language_fixture()
      assert Locale.list_languages() == [language]
    end

    test "get_language!/1 returns the language with given id" do
      language = language_fixture()
      assert Locale.get_language!(language.id) == language
    end

    test "create_language/1 with valid data creates a language" do
      valid_attrs = %{lang: "some lang"}

      assert {:ok, %Language{} = language} = Locale.create_language(valid_attrs)
      assert language.lang == "some lang"
    end

    test "create_language/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Locale.create_language(@invalid_attrs)
    end

    test "update_language/2 with valid data updates the language" do
      language = language_fixture()
      update_attrs = %{lang: "some updated lang"}

      assert {:ok, %Language{} = language} = Locale.update_language(language, update_attrs)
      assert language.lang == "some updated lang"
    end

    test "update_language/2 with invalid data returns error changeset" do
      language = language_fixture()
      assert {:error, %Ecto.Changeset{}} = Locale.update_language(language, @invalid_attrs)
      assert language == Locale.get_language!(language.id)
    end

    test "delete_language/1 deletes the language" do
      language = language_fixture()
      assert {:ok, %Language{}} = Locale.delete_language(language)
      assert_raise Ecto.NoResultsError, fn -> Locale.get_language!(language.id) end
    end

    test "change_language/1 returns a language changeset" do
      language = language_fixture()
      assert %Ecto.Changeset{} = Locale.change_language(language)
    end
  end
end
