defmodule NobleBackend.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :description, :string
    field :price, :decimal
    field :stock, :integer

    has_many :order_items, NobleBackend.OrderItems.OrderItem

    timestamps()
  end


  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:name, :description, :price, :stock])
    |> validate_required([:name, :price, :stock])
  end

  def changeset(product, params) do
    product
    |> cast(params, [:name, :description, :price, :stock])
    |> validate_required([:name, :price, :stock])
  end
end
