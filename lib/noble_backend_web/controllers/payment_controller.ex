defmodule NobleBackendWeb.PaymentController do
  alias NobleBackend.Payments.Payment
  alias NobleBackend.Payments
  use NobleBackendWeb, :controller

  action_fallback NobleBackendWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Payment{} = payment} <- Payments.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, %{payment: payment})
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Payment{} = payment} <- Payments.read(id) do
      conn
      |> put_status(:ok)
      |> render(:read, %{payment: payment})
    end
  end

  def update(conn, params) do
    with {:ok, %Payment{} = payment} <- Payments.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, %{payment: payment})
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Payment{} = payment} <- Payments.delete(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, %{payment: payment})
    end
  end
end
