import Config

# Note we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the `mix assets.deploy` task,
# which you should run after static files are built and
#
# config/prod.exs or config/dev.exs
config :stay, Stay.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "0360c2cc-3f6e-4bdf-ae42-b7f996a0bc75-user",
  password: "pw-6bd8645d-7164-4072-b9ea-977fa3f33764",
  database: "0360c2cc-3f6e-4bdf-ae42-b7f996a0bc75",
  hostname: "postgres-free-tier-v2020.gigalixir.com",
  port: 5432,
  url:
    {:system,
     "postgresql://0360c2cc-3f6e-4bdf-ae42-b7f996a0bc75-user:pw-6bd8645d-7164-4072-b9ea-977fa3f33764@postgres-free-tier-v2020.gigalixir.com:5432/0360c2cc-3f6e-4bdf-ae42-b7f996a0bc75"}

config :stay, StayWeb.Endpoint, cache_static_manifest: "priv/static/cache_manifest.json"

# Configures Swoosh API Client
config :swoosh, api_client: Swoosh.ApiClient.Finch, finch_name: Stay.Finch

# Disable Swoosh Local Memory Storage
config :swoosh, local: false

# Do not print debug messages in production
config :logger, level: :info

# Runtime production configuration, including reading
# of environment variables, is done on config/runtime.exs.
