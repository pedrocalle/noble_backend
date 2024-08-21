defmodule NobleBackend.Orders.Read do
  alias NobleBackend.Clients.Client
  alias NobleBackend.Repo

  def call(id) do
    case Repo.get(Client, id) do
      nil -> {:error, :not_found}
      client -> {:ok, client}
    end
  end
end
