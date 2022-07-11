defmodule Iksa.Menu.Link do
  use Ecto.Schema
  import Ecto.Changeset

  schema "links" do
    field :order, :integer
    field :title, :string
    field :url, :string
    field :lang_id, :id

    has_many :sublinks, Iksa.Menu.Sublink

    timestamps()
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:title, :url, :order, :lang_id])
    |> validate_required([:title, :url, :order, :lang_id])
  end
end
