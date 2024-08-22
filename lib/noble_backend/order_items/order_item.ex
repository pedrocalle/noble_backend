defmodule NobleBackend.OrderItems.OrderItem do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "order_items" do
    field :quantity, :integer
    field :unit_price, :decimal

    belongs_to :order, NobleBackend.Orders.Order
    belongs_to :product, NobleBackend.Products.Product

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:quantity, :unit_price, :order_id, :product_id])
    |> validate_required([:quantity, :unit_price, :order_id, :product_id])
  end

  def changeset(order_item, params) do
    order_item
    |> cast(params, [:quantity, :unit_price, :order_id, :product_id])
    |> validate_required([:quantity, :unit_price, :order_id, :product_id])
  end
end
