defmodule Iksa.Menu.Sublink do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sublinks" do
    field :order, :integer
    field :title, :string
    field :url, :string
    # field :link_id, :id

    belongs_to :link, Iksa.Menu.Link

    timestamps()
  end

  @doc false
  def changeset(sublink, attrs) do
    sublink
    |> cast(attrs, [:title, :url, :order])
    |> validate_required([:title, :url, :order])
  end
end
