defmodule DARRouter do
  use GenServer

  def start_link(name) do
    GenServer.start_link(__MODULE__, :ok, name: name)
  end

  def process_message(server, msg) do
    case msg do
      {:get_assets_all, params} ->
        GenServer.call(server, {:msg, msg})
      _ -> {:failure, msg}
    end

  end

  def init(:ok) do
    {:ok, ""}
  end

  def handle_call({:msg, msg}, _from, state) do
    {action, params} = msg
    case action do
      :get_assets_all ->
        xmsg = %{
          :name => "",
          :actions => [DARAction.retrievedoclist_all],
          :actionfilter => params,
          :comment => "",
          :metaid => "",
          :gfsid => ""
        }
        ret = DARWorkflow.process_message (DARModelInternalMessage.from_external_message xmsg)
        {:reply, {:response, {:request, ret}}, state}
    end
  end
end
