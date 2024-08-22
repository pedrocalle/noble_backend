defmodule NobleBackend.Clients.Client do
  alias Ecto.Changeset
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

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
    |> cast(params, [:name, :email, :password, :address, :phone])
    |> validate_required([:name, :email, :password])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email, message: "Email already in use")
    |> add_password_hash()
    |> IO.inspect()
  end

  def changeset(user, params) do
    user
    |> cast(params, [:name, :email, :address, :phone])
    |> validate_required([:name, :email])
    |> unique_constraint(:email)
    |> add_password_hash()
  end

  defp add_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    salt = Argon2.Base.gen_salt()
    change(changeset, %{password_hash: Argon2.Base.hash_password(password, salt)})
  end

  defp add_password_hash(changeset), do: changeset
end
