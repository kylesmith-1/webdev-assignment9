defmodule Events.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :date, :text, null: false
      add :title, :text, null: false, default: ""
      add :body, :text, null: false, default: ""
      add :user_id, references(:users, on_delete: :nothing),
        null: false

      timestamps()
    end

    create index(:posts, [:user_id])
  end
end