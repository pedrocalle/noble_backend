defmodule NobleBackendWeb.Token do
  alias NobleBackendWeb.Endpoint
  alias Phoenix.Token

  @sign_salt "noble_api"

  def sign(client) do
    Token.sign(Endpoint, @sign_salt, %{client_id: client.id})
  end

  def verify(token) do
    Token.verify(Endpoint, @sign_salt, token)
  end
end
