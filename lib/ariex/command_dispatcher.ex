defmodule ARIex.CommandDispatcher do
  use HTTPoison.Base

  def get!(endpoint, host, port, user, pass) do
    get!(url(endpoint, host, port, user, pass))
  end

  def post!(endpoint, host, port, user, pass, params \\ %{}) do
    post!(url(endpoint, host, port, user, pass, params), "")
  end

  def put!(endpoint, host, port, user, pass, params \\ %{}) do
    put!(url(endpoint, host, port, user, pass, params), "")
  end

  def delete!(endpoint, host, port, user, pass, params \\ %{}) do
    delete!(url(endpoint, host, port, user, pass, params))
  end

  def process_response_body(body) do
    body |> Poison.decode!
  end

  defp url(endpoint, host, port, user, pass, params \\ %{}) do
    api_param = "api_key=#{user}:#{pass}"
    query = case Enum.empty?(params) do
      true -> api_param
      false -> "#{api_param}&#{URI.encode_query(params)}"
    end
    "http://#{host}:#{port}/ari#{endpoint}?#{query}"
  end
end
