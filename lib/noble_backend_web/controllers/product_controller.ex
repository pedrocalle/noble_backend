defmodule NobleBackendWeb.ProductController do
  alias NobleBackend.Products
  alias NobleBackend.Products.Product
  use NobleBackendWeb, :controller

  action_fallback NobleBackendWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Product{} = product} <- Products.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, %{product: product})
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Product{} = product} <- Products.read(id) do
      conn
      |> put_status(:ok)
      |> render(:read, %{product: product})
    end
  end

  def update(conn, params) do
    with {:ok, %Product{} = product} <- Products.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, %{product: product})
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Product{} = product} <- Products.delete(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, %{product: product})
    end
  end
end
