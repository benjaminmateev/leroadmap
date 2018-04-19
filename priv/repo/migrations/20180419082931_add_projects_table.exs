defmodule Leroadmap.Repo.Migrations.AddProjectsTable do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string, null: false
      add :start_date, :date, null: false

      timestamps()
    end
  end
end
