defmodule Leroadmap.Stage do
  use Ecto.Schema
  import Ecto.Changeset

  alias Leroadmap.Project

  schema "stages" do
    field :name, :string
    field :color, :string
    belongs_to :project, Project

    timestamps()
  end

  def changeset(params, %Project{} = project) do
    %__MODULE__{}
    |> cast(params, [:name, :color])
    |> validate_required([:name, :color])
    |> put_assoc(:project, project)
    |> foreign_key_constraint(:project_id)
  end

  def update_changeset(feature, params) do
    feature
    |> cast(params, [:name, :color])
    |> validate_required([:name, :color])
  end
end
