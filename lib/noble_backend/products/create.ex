defmodule NobleBackend.Products.Create do
  alias NobleBackend.Products.Product
  alias NobleBackend.Repo

  def call(params) do
    params
    |> Product.changeset()
    |> Repo.insert()
  end
end
