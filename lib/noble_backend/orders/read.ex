defmodule NobleBackend.Orders.Read do
  alias NobleBackend.Orders.Order
  alias NobleBackend.Repo

  def call(id) do
    case Repo.get(Order, id) do
      nil -> {:error, :not_found}
      order -> {:ok, order}
    end
  end
end
