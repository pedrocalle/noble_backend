defmodule NobleBackend.Products.Update do
  alias NobleBackend.Repo
  alias NobleBackend.Clients.Client

  def call(%{"id" => id} = params) do
    IO.inspect(params)

    case Repo.get(Client, id) do
      nil -> {:error, :not_found}
      client -> update(client, params)
    end
  end

  defp update(client, params) do
    client
    |>Client.changeset(params)
    |>Repo.update()
  end
end
