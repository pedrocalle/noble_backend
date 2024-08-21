defmodule NobleBackend.Repo.Migrations.AddTables do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :name, :string
      add :email, :string, unique: true
      add :password_hash, :string
      add :address, :string
      add :phone, :string


      timestamps()
    end

    create unique_index(:clients, [:email])


    create table(:products) do
      add :name, :string
      add :description, :text
      add :price, :decimal
      add :stock, :integer

      timestamps()
    end

    create table(:orders) do
      add :client_id, references(:clients, on_delete: :nothing)
      add :status, :string
      add :total, :decimal
      add :stripe_payment_id, :string
      add :paid_value, :decimal

      timestamps()
    end

    create table(:order_items) do
      add :order_id, references(:orders, on_delete: :nothing)
      add :product_id, references(:products, on_delete: :nothing)
      add :quantity, :integer
      add :unit_price, :decimal

      timestamps()
    end

    create table(:payments) do
      add :order_id, references(:orders, on_delete: :nothing)
      add :payment_date, :naive_datetime
      add :value, :decimal
      add :method, :string

      timestamps()
  end

  end
end
