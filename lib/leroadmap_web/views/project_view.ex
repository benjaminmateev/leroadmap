defmodule LeroadmapWeb.ProjectView do
  use LeroadmapWeb, :view

  def render("index.json", %{projects: projects}) do
    render_many projects, __MODULE__, "show.json"
  end

  def render("show.json", %{project: project}) do
    %{
      id: project.id,
      name: project.name,
      start_date: project.start_date,
      inserted_at: project.inserted_at,
      updated_at: project.updated_at
    }
  end
end