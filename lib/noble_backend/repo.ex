defmodule NobleBackend.Repo do
  use Ecto.Repo,
    otp_app: :noble_backend,
    adapter: Ecto.Adapters.Postgres
end
