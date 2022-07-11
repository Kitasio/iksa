defmodule IksaWeb.LinkView do
  use IksaWeb, :view

  def language_select(f, changeset) do
    existing_ids = changeset |> Ecto.Changeset.get_change(:languages, []) |> Enum.map(& &1.data.id)

    language_opts =
      for lang <- Iksa.Locale.list_languages(),
          do: [key: lang.lang, value: lang.id, selected: lang.id in existing_ids]

    select(f, :lang_id, language_opts)
  end

end
