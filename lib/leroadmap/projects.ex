defmodule Leroadmap.Projects do

  alias Leroadmap.{Repo, Project, Feature}

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

  def fetch_all_features(%Project{} = project) do
    project
    |> Repo.preload(:features)
    |> Map.get(:features)

    # old version of the method for Ben to learn
    # %{features: features} = Repo.preload(project, : features)
    # features
  end

  def insert_feature(params, %Project{} = project) do
    params
    |> Feature.changeset(project)
    |> Repo.insert()
  end

  def fetch_feature(id) do
    case Repo.get(Feature, id) do
      nil -> {:error, :not_found}
      feature -> {:ok, feature}
    end
  end

end
