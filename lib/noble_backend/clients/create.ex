defmodule NobleBackend.Clients.Create do
  alias NobleBackend.Clients.Client
  alias NobleBackend.Repo
  def call(params) do
      params
      |>Client.changeset()
      |>Repo.insert()
  end
end
