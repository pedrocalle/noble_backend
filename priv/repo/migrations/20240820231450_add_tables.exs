defmodule NobleBackend.Repo.Migrations.AddTables do
  use Ecto.Migration

  def change do
    create table(:clients, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :email, :string, unique: true
      add :password_hash, :string
      add :address, :string
      add :phone, :string

      timestamps()
    end

    create unique_index(:clients, [:email])

    create table(:products, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :description, :text
      add :price, :decimal
      add :stock, :integer

      timestamps()
    end

    create table(:orders, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :client_id, references(:clients, type: :uuid)
      add :status, :string
      add :total, :decimal
      add :stripe_payment_id, :string
      add :paid_value, :decimal

      timestamps()
    end

    create table(:order_items, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :order_id, references(:orders, type: :uuid)
      add :product_id, references(:products, type: :uuid)
      add :quantity, :integer
      add :unit_price, :decimal

      timestamps()
    end

    create table(:payments, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :order_id, references(:orders, type: :uuid)
      add :payment_date, :naive_datetime
      add :value, :decimal
      add :method, :string

      timestamps()
    end
  end
end
