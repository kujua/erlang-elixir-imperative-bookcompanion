defmodule DARDataStore do
  use Supervisor

  def start_link(name) do
    Supervisor.start_link(__MODULE__, [], name: {:global, name})
  end

  def init(_opts) do
    children = [
      worker(DARMetaData, [DARMetaData]),
      worker(DARGfs, [DARGfs])
    ]
    supervise children, strategy: :one_for_one
  end
end
