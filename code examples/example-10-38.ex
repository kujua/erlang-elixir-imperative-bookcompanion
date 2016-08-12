defmodule DarApi do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec
    children = [
      supervisor(DarApi.Endpoint, []),
      worker(DARRouter,[DARRouter])
    ]
    opts = [strategy: :one_for_one, name: DarApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    DarApi.Endpoint.config_change(changed, removed)
    :ok
  end
end
