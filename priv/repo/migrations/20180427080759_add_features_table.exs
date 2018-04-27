defmodule Leroadmap.Repo.Migrations.AddFeaturesTable do
  use Ecto.Migration

  def change do
    create table(:features) do
      add :name, :string, null: false
      add :description, :text
      add :state, :string, null: false
      add :project_id, references(:projects, on_delete: :delete_all), null: false

      timestamps()
    end
  end
end
