defmodule NobleBackend.Payments do
  alias NobleBackend.Payments.Delete
  alias NobleBackend.Payments.Update
  alias NobleBackend.Payments.Read
  alias NobleBackend.Payments.Create

  defdelegate create(params), to: Create, as: :call
  defdelegate read(id), to: Read, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
end
