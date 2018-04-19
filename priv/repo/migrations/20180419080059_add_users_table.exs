defmodule Leroadmap.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:email, :citext, null: false)
      add(:name, :string, null: false)
      add(:avatar, :string)

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
