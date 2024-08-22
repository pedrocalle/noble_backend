defmodule NobleBackendWeb.OrderJSON do
  alias NobleBackend.Orders.Order
  def create(%{order: order}) do
    %{
      message: "Pedido criado com sucesso!",
      data: data(order)
    }
  end

  def read(%{order: order}), do: data(order)

  def update(%{order: order}) do
    %{
      message: "Pedido atualizado com sucesso!",
      data: data(order)
    }
  end

  def delete(%{order: order}) do
    %{
      message: "Pedido deletado com sucesso!",
      data: data(order)
    }
  end

  def data(%Order{} = order) do
    %{
      id: order.id,
      paid_value: order.paid_value,
      status: order.status,
      total: order.total
    }
  end
end
