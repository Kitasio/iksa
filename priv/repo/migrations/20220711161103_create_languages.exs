defmodule Iksa.Repo.Migrations.CreateLanguages do
  use Ecto.Migration

  def change do
    create table(:languages) do
      add :lang, :string

      timestamps()
    end
  end
end
