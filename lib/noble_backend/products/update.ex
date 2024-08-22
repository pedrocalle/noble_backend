defmodule NobleBackend.Products.Update do
  alias NobleBackend.Repo
  alias NobleBackend.Products.Product

  def call(%{"id" => id} = params) do
    IO.inspect(params)

    case Repo.get(Product, id) do
      nil -> {:error, :not_found}
      product -> update(product, params)
    end
  end

  defp update(product, params) do
    product
    |> Product.changeset(params)
    |> Repo.update()
  end
end
