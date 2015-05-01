defmodule Ariex.Listener do
  @moduledoc """
  Wrap the websocket listener in a process which dispatches received events
  """

  @doc """
  Spawn link a process to pull data from the websocket and send it to the
  calling process
  """
  @spec listen(String, Integer, String, String, String) :: {:ok, pid}
  def listen(host, port, user, pass, app) do
    me = self()
    socket = Socket.Web.connect! host, port, [path: "/ari/events?api_key=#{user}:#{pass}&app=#{app}"]
    {:ok, fn -> init(socket, me) end |> spawn_link}
  end

  defp init(%{socket: underlying} = socket, pid) do
    true = Process.link(underlying)
    loop(socket, pid)
  end

  defp loop(socket, pid) do
    {:text, event} = Socket.Web.recv!(socket)
    send(pid, Poison.Parser.parse!(event))
    loop(socket, pid)
  end
end
