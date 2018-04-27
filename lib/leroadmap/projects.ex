defmodule Leroadmap.Projects do

  alias Leroadmap.{Repo, Project}

  def fetch_all_projects do
    Repo.all(Project)
  end

  def insert_project(params) do
    params
    |> Project.changeset()
    |> Repo.insert()
  end

  def fetch_project(id) do
    case Repo.get(Project, id) do
      nil -> {:error, :not_found}
      project -> {:ok, project}
    end
  end
end
