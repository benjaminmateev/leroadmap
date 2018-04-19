defmodule Leroadmap.Repo.Migrations.AddCitext do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION citext", "DROP EXTENSION citext"
  end
end
