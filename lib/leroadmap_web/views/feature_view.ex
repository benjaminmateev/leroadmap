defmodule LeroadmapWeb.FeatureView do
  use LeroadmapWeb, :view

  def render("index.json", %{features: features}) do
    render_many features, __MODULE__, "show.json"
  end

  def render("show.json", %{feature: feature}) do
    %{
      id: feature.id,
      name: feature.name,
      description: feature.description,
      state: feature.state,
      project_id: feature.project_id,
      inserted_at: feature.inserted_at,
      updated_at: feature.updated_at
    }
  end
end
