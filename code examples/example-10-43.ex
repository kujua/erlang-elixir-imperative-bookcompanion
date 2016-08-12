alias Experimental.GenStage

defmodule EventHandler do
  use GenStage

  def start_link() do
    GenStage.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    {:consumer, :ok, subscribe_to: [EventManager]}
  end

  def handle_events(event, _from, state) do
    IO.inspect event
    {:noreply, [], event}
  end
end
