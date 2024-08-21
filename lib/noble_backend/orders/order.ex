defmodule NobleBackend.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :status, :string
    field :total, :decimal
    field :stripe_payment_id, :string
    field :paid_value, :decimal

    belongs_to :client, NobleBackend.Clients.Client
    has_many :order_items, NobleBackend.OrderItems.OrderItem
    has_many :payments, NobleBackend.Payments.Payment

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:status, :total, :stripe_payment_id, :paid_value, :client_id])
    |> validate_required([:status, :total, :client_id])
  end

  def changeset(order, params) do
    order
    |> cast(params, [:status, :total, :stripe_payment_id, :paid_value, :client_id])
    |> validate_required([:status, :total, :client_id])
  end
end
