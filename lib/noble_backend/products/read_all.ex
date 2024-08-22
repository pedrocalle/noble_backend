defmodule NobleBackend.Products.ReadAll do
  alias NobleBackend.Products.Product
  alias NobleBackend.Repo

  def call() do
    Repo.all(Product)
  end
end
