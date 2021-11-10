# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :zsonline, Content.Repo,
  database: "content_repo",
  username: "armin",
  password: "1234",
  hostname: "localhost",
  pool_size: 10

# Configure your database
config :zsonline, Zsonline.Repo,
  username: "armin",
  password: "1234",
  database: "zsonline",
  hostname: "localhost",
  pool_size: 10

config :zsonline,
  ecto_repos: [Zsonline.Repo],
  generators: [binary_id: true]

# config :app, App.Repo, migration_primary_key: [name: :uuid, type: :binary_id]

# Configures the endpoint
config :zsonline, ZsonlineWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TsbiiJZYxgmqVKzAfnpp+1B2+Xa5NIrTr5RGfXiPSa1+C82/ULEUEkwC3qxEZhEn",
  render_errors: [view: ZsonlineWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Zsonline.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
