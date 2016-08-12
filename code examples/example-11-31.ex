defmodule EventHandler do
  use GenEvent
  require Logger

  def init(args) do
    {:ok, args}
  end

  def handle_event(event, args) do
    process_event(event, args)
    {:ok, args}
  end

  defp process_event({:error, error}, _), do: Logger.warn("Driver error #{error}")

  defp process_event({:raw_reading, msg}, args) do
    update_state({:raw, msg}, args)
    {x, y, z} = msg
    %{axis_gauss: {xy_gauss,z_gauss}} = SensorState.axis_gauss(args.state_name)
    sx = x / xy_gauss * 100
    sy = y / xy_gauss * 100
    sz = z / z_gauss * 100
    GenEvent.notify(args.evtmgr_name, {:scaled_reading, {sx, sy, sz}})
  end

  defp process_event({:scaled_reading, msg}, args) do
    update_state({:scaled, msg}, args)
    {x, y, _z} = msg
    heading = :math.atan2(y,x) |> bearing_to_degrees
    GenEvent.notify(args.evtmgr_name, {:heading, heading})
  end

  defp process_event({type, _val} = event, args)
            when type in [:heading, :available] do
    update_state(event, args)
    GenEvent.notify(args.evtmgr_name, event)
  end

  defp process_event({type, msg}, _args)
            when is_atom(type) do
    Logger.warn("Unknown event received.\nType: #{type}\nMsg: #{inspect msg}")
  end

  defp process_event(event, _args) do
    Logger.warn("Unknown event received.\n#{inspect event}")
  end

  defp update_state(event, args) do
    SensorState.update(args.state_name, event)
    event
  end
end
