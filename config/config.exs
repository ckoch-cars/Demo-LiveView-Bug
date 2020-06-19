# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :test_lv_checkbox,
  ecto_repos: [TestLvCheckbox.Repo]

# Configures the endpoint
config :test_lv_checkbox, TestLvCheckboxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "liHozL1ygxN2nLIiJQEeUmnD0oAsbetX0LXSt/JODhaJozme7CFFEeRXa03wofe9",
  render_errors: [view: TestLvCheckboxWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: TestLvCheckbox.PubSub,
  live_view: [signing_salt: "dJGAvb9O"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
