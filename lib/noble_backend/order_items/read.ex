defmodule NobleBackend.OrderItems.Read do
  alias NobleBackend.OrderItems.OrderItem
  alias NobleBackend.Repo

  def call(id) do
    case Repo.get(OrderItem, id) do
      nil -> {:error, :not_found}
      order_item -> {:ok, order_item}
    end
  end
end
