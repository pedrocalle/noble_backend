defmodule NobleBackend.Products do
  alias NobleBackend.Products.Delete
  alias NobleBackend.Products.Update
  alias NobleBackend.Products.Read
  alias NobleBackend.Products.Create

  defdelegate create(params), to: Create, as: :call
  defdelegate read(id), to: Read, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
end
