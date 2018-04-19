defmodule LeroadmapWeb.ProjectController do
  use LeroadmapWeb, :controller

  alias Leroadmap.{Repo, Project}
  def index(conn, _params) do
    projects = Repo.all(Project)
    render(conn, "index.json", projects: projects)
  end

  def  create(conn, params) do
    result = 
      params
      |> Project.changeset()
      |> Repo.insert()

    case result do
      {:ok, project} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", project_path(conn, :show, project))
        |> render("show.json", project: project)
      {:error, _changeset} ->
        conn 
        |> put_status(:bad_request)
        |> json(%{error: "Couldn't create project"})
    end
  end

  def show(conn, %{"id" => id}) do
    project = Repo.get(Project, id)

    render(conn, "show.json", project: project)
  end
end