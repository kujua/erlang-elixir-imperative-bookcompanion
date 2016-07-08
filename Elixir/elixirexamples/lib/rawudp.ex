defmodule RawUdp do
  use Application

  def start(_type, _args) do
    RawUdpSupervisor.start_link
  end
end

defmodule RawUdpSupervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [
      worker(RawUdpServer, [])
    ]
    supervise(children, strategy: :one_for_one)
  end
end

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
