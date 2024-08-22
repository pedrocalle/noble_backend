defmodule NobleBackend.OrderItems.Create do
  alias NobleBackend.OrderItems.OrderItem
  alias NobleBackend.Repo
  def call(params) do
      params
      |>OrderItem.changeset()
      |>Repo.insert()
  end
end
