defmodule NobleBackend.Payments.Create do
  alias NobleBackend.Payments.Payment
  alias NobleBackend.Repo

  def call(params) do
    params
    |> Payment.changeset()
    |> Repo.insert()
  end
end
