defmodule NobleBackend.Clients.Client do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clients" do
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :address, :string
    field :phone, :string

    has_many :orders, NobleBackend.Orders.Order

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:name, :email, :password_hash, :address, :phone])
    |> validate_required([:name, :email, :password_hash])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email, message: "Email already in use")
  end

  def changeset(user, params) do
    user
    |> cast(params, [:name, :email, :address, :phone])
    |> validate_required([:name, :email])
    |> unique_constraint(:email)
  end
end
