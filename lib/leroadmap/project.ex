defmodule Leroadmap.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :name, :string
    field :start_date, :date

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:name, :start_date])
    |> validate_required([:name, :start_date])
  end

  def update_changeset(user, params) do
    user
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end