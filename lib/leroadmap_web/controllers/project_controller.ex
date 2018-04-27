defmodule LeroadmapWeb.ProjectController do
  use LeroadmapWeb, :controller

  action_fallback(LeroadmapWeb.FallbackController)

  alias Leroadmap.Projects

  def index(conn, _params) do
    projects = Projects.fetch_all_projects()
    render(conn, "index.json", projects: projects)
  end

  def  create(conn, params) do
    with {:ok, project} <- Projects.insert_project(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", project_path(conn, :show, project))
      |> render("show.json", project: project)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, project} <- Projects.fetch_project(id) do
      render(conn, "show.json", project: project)
    end
  end
end
