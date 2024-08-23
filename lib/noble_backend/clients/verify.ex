defmodule NobleBackend.Clients.Verify do
  alias NobleBackend.Clients.Client
  alias NobleBackend.Repo

  def call(%{"email" => email, "password" => password}) do
    case Repo.get_by(Client, email: email) do
      nil -> {:error, %{error: "Email e/ou senha incorretos"}}
      client -> verify(client, password)
    end
  end

  defp verify(client, password) do
    case Argon2.verify_pass(password, client.password_hash) do
      true -> {:ok, client}
      false -> {:error, %{message: "Email e/ou senha incorretos"}}
    end
  end
end
