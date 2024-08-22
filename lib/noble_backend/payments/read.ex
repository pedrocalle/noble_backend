defmodule NobleBackend.Payments.Read do
  alias NobleBackend.Payments.Payment
  alias NobleBackend.Repo

  def call(id) do
    case Repo.get(Payment, id) do
      nil -> {:error, :not_found}
      payment -> {:ok, payment}
    end
  end
end
