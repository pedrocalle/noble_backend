defmodule NobleBackend.Clients do
  alias NobleBackend.Clients.Verify
  alias NobleBackend.Clients.Delete
  alias NobleBackend.Clients.Update
  alias NobleBackend.Clients.Read
  alias NobleBackend.Clients.Create

  defdelegate create(params), to: Create, as: :call
  defdelegate read(id), to: Read, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
  defdelegate verify(params), to: Verify, as: :call
end
