defmodule NobleBackendWeb.ClientController do
  alias NobleBackend.Clients.Client
  alias NobleBackend.Clients

  use NobleBackendWeb, :controller

  action_fallback NobleBackendWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Client{} = client} <- Clients.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, %{client: client})
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Client{} = client} <- Clients.read(id) do
      conn
      |> put_status(:ok)
      |> render(:read, %{client: client})
    end
  end

  def update(conn, params) do
    with {:ok, %Client{} = client} <- Clients.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, %{client: client})
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Client{} = client} <- Clients.delete(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, %{client: client})
    end
  end
end
