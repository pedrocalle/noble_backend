defmodule NobleBackend.Orders do
  alias NobleBackend.Orders.Delete
  alias NobleBackend.Orders.Update
  alias NobleBackend.Orders.Read
  alias NobleBackend.Orders.Create

  defdelegate create(params), to: Create, as: :call
  defdelegate read(id), to: Read, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
end
