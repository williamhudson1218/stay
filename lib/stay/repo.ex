defmodule Stay.Repo do
  use Ecto.Repo,
    otp_app: :stay,
    adapter: Ecto.Adapters.Postgres
end
