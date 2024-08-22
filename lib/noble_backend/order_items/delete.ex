defmodule NobleBackend.OrderItems.Delete do
  alias NobleBackend.Repo
  alias NobleBackend.OrderItems.OrderItem

  def call(id) do
    case Repo.get(OrderItem, id) do
      nil -> {:error, :not_found}
      order_item -> Repo.delete(order_item)
    end
  end
end
