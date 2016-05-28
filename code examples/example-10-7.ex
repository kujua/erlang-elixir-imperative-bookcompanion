defmodule RawUdpServer do
  use GenServer
  require Logger

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def init (:ok) do
    {:ok, _socket} = :gen_udp.open(4242)
  end

  def handle_info({:udp, _socket, _ip, _port, data}, state) do
    Logger.info "Received a message: " <> inspect(data)
    {:noreply, state}
  end
end
