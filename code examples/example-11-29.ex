defmodule DarApi do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec
    children = [
      supervisor(DarApi.Repo, []),
    ]
    opts = [strategy: :one_for_one, name: DarApi.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
