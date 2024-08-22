defmodule NobleBackend.Orders.Update do
  alias NobleBackend.Repo
  alias NobleBackend.Orders.Order

  def call(%{"id" => id} = params) do
    IO.inspect(params)

    case Repo.get(Order, id) do
      nil -> {:error, :not_found}
      order -> update(order, params)
    end
  end

  defp update(order, params) do
    order
    |>Order.changeset(params)
    |>Repo.update()
  end
end
