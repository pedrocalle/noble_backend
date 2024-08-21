defmodule NobleBackend.Payments.Payment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "payments" do
    field :payment_date, :naive_datetime
    field :value, :decimal
    field :method, :string

    belongs_to :order, NobleBackend.Orders.Order

    timestamps()
  end


  def changeset( params) do
    %__MODULE__{}
    |> cast(params, [:payment_date, :value, :method, :order_id])
    |> validate_required([:payment_date, :value, :method, :order_id])
  end

  def changeset(payment, params) do
    payment
    |> cast(params, [:payment_date, :value, :method, :order_id])
    |> validate_required([:payment_date, :value, :method, :order_id])
  end
end
