defmodule LeroadmapWeb.FeatureController do
  use LeroadmapWeb, :controller

  action_fallback(LeroadmapWeb.FallbackController)

  alias Leroadmap.Projects

  def index(conn, %{"project_id" => project_id}) do
    with {:ok, project} <- Projects.fetch_project(project_id) do
      features = Projects.fetch_all_features(project)
      render(conn, "index.json", features: features)
    end
  end

  def  create(conn, %{"project_id" => project_id} = params) do
    with {:ok, project} <- Projects.fetch_project(project_id),
         {:ok, feature} <- Projects.insert_feature(params, project) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", feature_path(conn, :show, feature))
      |> render("show.json", feature: feature)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, feature} <- Projects.fetch_feature(id) do
      render(conn, "show.json", feature: feature)
    end
  end
end
