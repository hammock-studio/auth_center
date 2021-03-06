# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :auth_center,
  ecto_repos: [AuthCenter.Repo]

# Configures the endpoint
config :auth_center, AuthCenter.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "aXgo/ThgEBDBmDzehqfqfqpPwZqUxwh31UwBIIjOH4O775IBFpqzrH/g915xURZ7",
  render_errors: [view: AuthCenter.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AuthCenter.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
