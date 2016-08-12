defmodule GenEventExample do
  use GenEvent

  def handle_event(event, s) do
    IO.puts("Event: " <> event)
    IO.puts("Old State: " <> inspect s)
    {:ok, event}
  end
end
