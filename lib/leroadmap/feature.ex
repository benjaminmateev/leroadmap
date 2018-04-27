defmodule Leroadmap.Feature do
  use Ecto.Schema
  import Ecto.Changeset

  alias Leroadmap.Project

  schema "features" do
    field :name, :string
    field :description, :string
    field :state, :string
    belongs_to :project, Project

    timestamps()
  end

  def changeset(params, %Project{} = project) do
    %__MODULE__{}
    |> cast(params, [:name, :description, :state])
    |> validate_required([:name, :state])
    |> put_assoc(:project, project)
    |> foreign_key_constraint(:project_id)
  end

  def update_changeset(feature, params) do
    feature
    |> cast(params, [:name, :description, :state])
    |> validate_required([:name, :state])
  end
end
