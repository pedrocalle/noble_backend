defmodule NobleBackend.Products.Read do
  alias NobleBackend.Products.Product
  alias NobleBackend.Repo

  def call(id) do
    case Repo.get(Product, id) do
      nil -> {:error, :not_found}
      product -> {:ok, product}
    end
  end
end
