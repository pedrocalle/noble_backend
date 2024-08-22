defmodule NobleBackendWeb.ProductJSON do
  alias NobleBackend.Products.Product

  def create(%{product: product}) do
    %{
      message: "Produto criado com sucesso!",
      data: data(product)
    }
  end

  def read(%{product: product}), do: data(product)

  def update(%{product: product}) do
    %{
      message: "Produto atualizado com sucesso!",
      data: data(product)
    }
  end

  def delete(%{product: product}) do
    %{
      message: "Produto deletado com sucesso!",
      data: data(product)
    }
  end

  def data(%Product{} = product) do
    %{
      id: product.id,
      name: product.name,
      price: product.price,
      stock: product.stock,
      description: product.description
    }
  end
end
