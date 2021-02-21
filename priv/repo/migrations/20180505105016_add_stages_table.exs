defmodule Leroadmap.Repo.Migrations.AddStagesTable do
  use Ecto.Migration

  def change do
    create table(:stages) do
      add :name, :string, null: false
      add :color, :string, null: false
      add :project_id, references(:projects, on_delete: :delete_all), null: false

      timestamps()
    end
  end
end
