defmodule NobleBackendWeb.OrderController do
  alias NobleBackend.Orders
  alias NobleBackend.Orders.Order
  use NobleBackendWeb, :controller

  action_fallback NobleBackendWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Order{} = order} <- Orders.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, %{order: order})
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Order{} = order} <- Orders.read(id) do
      conn
      |> put_status(:ok)
      |> render(:read, %{order: order})
    end
  end

  def update(conn, params) do
    with {:ok, %Order{} = order} <- Orders.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, %{order: order})
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Order{} = order} <- Orders.delete(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, %{order: order})
    end
  end
end
