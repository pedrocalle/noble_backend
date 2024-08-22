# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :noble_backend,
  ecto_repos: [NobleBackend.Repo],
  generators: [timestamp_type: :utc_datetime]

config :stripity_stripe, api_key: System.get_env("API_KEY")

# Configures the endpoint
config :noble_backend, NobleBackendWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: NobleBackendWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: NobleBackend.PubSub,
  live_view: [signing_salt: "YZXIpHFp"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
