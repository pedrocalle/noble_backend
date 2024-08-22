defmodule NobleBackend.Orders.Create do
  alias NobleBackend.Orders.Order
  alias NobleBackend.Repo
  def call(params) do
      params
      |>Order.changeset()
      |>Repo.insert()
  end
end
