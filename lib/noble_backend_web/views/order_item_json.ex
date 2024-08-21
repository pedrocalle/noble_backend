defmodule NobleBackendWeb.OrderItemJSON do
  alias NobleBackend.OrderItems.OrderItem
  def create(order_item) do
    %{
      message: "Item do pedido adicionado com sucesso!",
      data: data(order_item)
    }
  end

  def read(order_item), do: data(order_item)

  def update(order_item) do
    %{
      message: "Item do pedido atualizado com sucesso!",
      data: data(order_item)
    }
  end

  def delete(order_item) do
    %{
      message: "Item do pedido deletado com sucessso!",
      data: data(order_item)
    }
  end

  def data(%OrderItem{} = order_item) do
    %{
      id: order_item.id,
      quantity: order_item.quantity,
      unit_price: order_item.unit_price
    }
  end
end
