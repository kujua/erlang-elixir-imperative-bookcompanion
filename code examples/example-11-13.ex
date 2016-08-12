defmodule DARGfs do
  use GenServer

  def process_message(node,module,function,params) do
     case :rpc.call(
              node,
              module,
              function,
              params) do
        {:ok, f, fname} -> f
        _ -> "node down"
      end
  end

  def start_link(name) do
    GenServer.start_link(__MODULE__, :ok, name: name)
  end

  def init(:ok) do
    {:ok, ""}
  end

  def handle_call({:msg, msg}, _from, state) do
    {:reply, "", state}
  end
end
