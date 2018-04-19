defmodule Leroadmap.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :avatar, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:email, :name, :avatar])
    |> validate_required([:email, :name])
    |> unique_constraint(:email)
  end

  def update_changeset(user, params) do
    user
    |> cast(params, [:name, :avatar])
    |> validate_required([:name])
  end
end