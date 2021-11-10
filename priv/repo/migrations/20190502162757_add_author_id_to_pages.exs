defmodule Zsonline.Repo.Migrations.AddAuthorIdToPages do
  use Ecto.Migration

  def change do
    alter table(:pages)do
      add :author_id, references(:authors,on_delete: :delete_all, type: :binary_id), null: false
    end

    create index(:pages, [:author_id])

  end
end
