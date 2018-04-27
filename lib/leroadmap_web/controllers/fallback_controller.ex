defmodule LeroadmapWeb.FallbackController do
  use Phoenix.Controller

  def call(conn, {:error, %Ecto.Changeset{}}) do
    conn
    |> put_status(422)
    |> json(%{error: "Insert or update failed"})
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(404)
    |> json(%{error: "Not found"})
  end

  def call(conn, {:error, _error}) do
    conn
    |> put_status(500)
    |> json(%{error: "Internal server error"})
  end
end
