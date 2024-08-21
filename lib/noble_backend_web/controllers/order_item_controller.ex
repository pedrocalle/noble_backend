defmodule NobleBackendWeb.OrderItemController do
  alias NobleBackend.OrderItems
  alias NobleBackend.OrderItems.OrderItem
  use NobleBackendWeb, :controller

  action_fallback NobleBackendWeb.FallbackController

  def create(conn, params) do
    with {:ok, %OrderItem{} = order_item} <- OrderItems.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, %{order_item: order_item})
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %OrderItem{} = order_item} <- OrderItems.read(id) do
      conn
      |> put_status(:ok)
      |> render(:read, %{order_item: order_item})
    end
  end

  def update(conn, params) do
    with {:ok, %OrderItem{} = order_item} <- OrderItems.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, %{order_item: order_item})
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %OrderItem{} = order_item} <- OrderItems.delete(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, %{order_item: order_item})
    end
  end
end
