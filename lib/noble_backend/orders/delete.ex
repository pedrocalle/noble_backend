defmodule NobleBackend.Orders.Delete do
  alias NobleBackend.Repo
  alias NobleBackend.Clients.Client

  def call(id) do
    case Repo.get(Client, id) do
      nil -> {:error, :not_found}
      client -> Repo.delete(client)
    end
  end
end
