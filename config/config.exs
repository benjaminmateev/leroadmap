# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :leroadmap, ecto_repos: [Leroadmap.Repo]

# Configures the endpoint
config :leroadmap, LeroadmapWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "G6J+gwIOxKwlmVokf6BFhup47NcZkn1P4WWYJa3B9hyfJE3tqAW/9sEpYxMvIT24",
  render_errors: [view: LeroadmapWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Leroadmap.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
