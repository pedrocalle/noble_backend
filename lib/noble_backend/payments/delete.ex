defmodule NobleBackend.Payments.Delete do
  alias NobleBackend.Repo
  alias NobleBackend.Payments.Payment

  def call(id) do
    case Repo.get(Payment, id) do
      nil -> {:error, :not_found}
      payment -> Repo.delete(payment)
    end
  end
end
