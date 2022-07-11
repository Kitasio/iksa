defmodule IksaWeb.SublinkView do
  use IksaWeb, :view

  def link_select(f, changeset) do
    existing_ids = changeset |> Ecto.Changeset.get_change(:links, []) |> Enum.map(& &1.data.id)

    link_opts =
      for link <- Iksa.Menu.list_links(),
          do: [key: link.title, value: link.id, selected: link.id in existing_ids]

    select(f, :link_id, link_opts)
  end
end
