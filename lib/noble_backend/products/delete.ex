defmodule NobleBackend.Products.Delete do
  alias NobleBackend.Repo
  alias NobleBackend.Products.Product

  def call(id) do
    case Repo.get(Product, id) do
      nil -> {:error, :not_found}
      product -> Repo.delete(product)
    end
  end
end
