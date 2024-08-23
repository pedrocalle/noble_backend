defmodule NobleBackendWeb.ClientJSON do
  alias NobleBackend.Clients.Client

  def create(%{client: client}) do
    %{
      message: "Usuário criado com sucesso!",
      data: data(client)
    }
  end

  def read(%{client: client}), do: data(client)

  def update(%{client: client}) do
    %{
      message: "Usuário atualizado com sucesso!",
      data: data(client)
    }
  end

  def delete(%{client: client}) do
    %{
      message: "Usuário deletado com sucesso!",
      data: data(client)
    }
  end

  def login(%{token: token}) do
    %{
      message: "User autenticado com sucesso",
      bearer: token
    }
  end

  def data(%Client{} = client) do
    %{
      id: client.id,
      name: client.name,
      email: client.email,
      password_hash: client.password_hash,
      phone: client.phone,
      address: client.address
    }
  end
end
