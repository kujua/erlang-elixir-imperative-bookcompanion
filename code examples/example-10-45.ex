alias Experimental.GenStage

defmodule Patron do
  use GenStage

  def init(order) do
    {:consumer, order}
  end

  def handle_events(event, _from, order) do
    IO.inspect(event)
    IO.inspect(order)
    Process.sleep(1000)
    {:noreply, [], order}
  end
end
