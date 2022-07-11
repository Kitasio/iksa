defmodule Iksa.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :title, :string
      add :url, :string
      add :order, :integer
      add :lang_id, references(:languages, on_delete: :nothing)

      timestamps()
    end

    create index(:links, [:lang_id])
  end
end
