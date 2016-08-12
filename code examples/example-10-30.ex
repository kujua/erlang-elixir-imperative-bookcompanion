defmodule DARWf do
  use GenStateMachine

  # Client
  def start_link(m) do
    GenStateMachine.start_link(DARWf, {DARState.idle, m}, name: DARWf)
  end
  
  # ... truncated

  # Server (callbacks)

  def handle_event({:call, from}, :requestreceived, state, msg) do
    case DARWorkflowOperations.validate_request msg do
      {:ok, res} ->
        {:next_state, DARState.requestvalidated,
            %{msg | :state => DARState.requestvalidated, :actiongroups => res},
            {:reply, from, %{msg | :state => DARState.requestvalidated, :actiongroups => res}}}
      {_, err} ->
        {:next_state, DARState.errorstate,
            %{msg | :state => DARState.errorstate, :comment => err},
            {:reply, from, %{msg | :state => DARState.errorstate, :comment => err}}}
    end
  end

# ... truncated

  def handle_event(event_type, event_content, state, data) do
    # Call the default implementation from GenStateMachine
    super(event_type, event_content, state, data)
  end
end
