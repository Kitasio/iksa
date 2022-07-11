defmodule Iksa.Repo.Migrations.CreateSublinks do
  use Ecto.Migration

  def change do
    create table(:sublinks) do
      add :title, :string
      add :url, :string
      add :order, :integer
      add :link_id, references(:links, on_delete: :nothing)

      timestamps()
    end

    create index(:sublinks, [:link_id])
  end
end
