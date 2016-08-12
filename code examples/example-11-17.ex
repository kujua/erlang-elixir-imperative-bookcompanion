defmodule DARMetaData do
  use GenServer

  def process_message(msg) do
    GenServer.call(server, {:msg, msg})
  end

  def start_link(name) do
    DARMetaData.Repo.start_link
    GenServer.start_link(__MODULE__, :ok, name: name)
  end

  def init(:ok) do
    {:ok, ""}
  end

  def handle_call({:msg, msg}, _from, state) do
    rep = DarMetaData.DataAccess.process_message(msg)
    {:reply, rep, state}
  end
end
