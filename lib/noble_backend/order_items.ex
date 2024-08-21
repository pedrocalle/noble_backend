defmodule NobleBackend.OrderItems do
  alias NobleBackend.OrderItems.Delete
  alias NobleBackend.OrderItems.Update
  alias NobleBackend.OrderItems.Read
  alias NobleBackend.OrderItems.Create

  defdelegate create(params), to: Create, as: :call
  defdelegate read(id), to: Read, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
end
