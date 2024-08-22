defmodule NobleBackend.Payments.Update do
  alias NobleBackend.Repo
  alias NobleBackend.Payments.Payment

  def call(%{"id" => id} = params) do
    case Repo.get(Payment, id) do
      nil -> {:error, :not_found}
      payment -> update(payment, params)
    end
  end

  defp update(payment, params) do
    payment
    |> Payment.changeset(params)
    |> Repo.update()
  end
end
