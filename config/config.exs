# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :good_bread,
  ecto_repos: [GoodBread.Repo]

# Configures the endpoint
config :good_bread, GoodBreadWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YkBNdeA7mwxgYDyDaElY01WCh2d3EVz+CVDsTcNzlgQmWDBD7nls/67uMZBeyMRc",
  render_errors: [view: GoodBreadWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: GoodBread.PubSub,
  live_view: [signing_salt: "wYAdmViz"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
