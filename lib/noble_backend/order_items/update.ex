defmodule NobleBackend.OrderItems.Update do
  alias NobleBackend.Repo
  alias NobleBackend.OrderItems.OrderItem

  def call(%{"id" => id} = params) do
    IO.inspect(params)

    case Repo.get(OrderItem, id) do
      nil -> {:error, :not_found}
      order_item -> update(order_item, params)
    end
  end

  defp update(order_item, params) do
    order_item
    |>OrderItem.changeset(params)
    |>Repo.update()
  end
end
