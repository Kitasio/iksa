defmodule Iksa.Locale.Language do
  use Ecto.Schema
  import Ecto.Changeset

  schema "languages" do
    field :lang, :string

    timestamps()
  end

  @doc false
  def changeset(language, attrs) do
    language
    |> cast(attrs, [:lang])
    |> validate_required([:lang])
  end
end
