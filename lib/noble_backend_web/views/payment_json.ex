defmodule NobleBackendWeb.PaymentJSON do
  alias NobleBackend.Payments.Payment
  def create(%{payment: payment}) do
    %{
      message: "Pagamento criado com sucesso!",
      data: data(payment)
    }
  end

  def read(%{payment: payment}), do: data(payment)

  def update(%{payment: payment}) do
    %{
      message: "Pagamento atualizado com sucesso!",
      data: data(payment)
    }
  end

  def delete(%{payment: payment}) do
    %{
      message: "Pagamento deletado com sucesso!",
      data: data(payment)
    }
  end

  def data(%Payment{} = payment) do
    %{
      id: payment.id,
      method: payment.method,
      payment_date: payment.payment_date,
      value: payment.value,
      order_id: payment.order_id
    }
  end
end
