defmodule NobleBackend.Orders.Delete do
  alias NobleBackend.Repo
  alias NobleBackend.Orders.Order

  def call(id) do
    case Repo.get(Order, id) do
      nil -> {:error, :not_found}
      order -> Repo.delete(order)
    end
  end
end
