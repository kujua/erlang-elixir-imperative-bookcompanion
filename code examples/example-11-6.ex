defmodule DARWf do
  use GenStateMachine

  # Client

  def start_link(m) do
    GenStateMachine.start_link(DARWf, {DARState.idle, m}, name: DARWf)
  end

  def terminate do
      GenStateMachine.stop(DARWf, :normal)
  end

  def new_request do
    r = GenStateMachine.call(DARWf, DARState.requestreceived)
    DARWorkflow.process_message r
  end

  def retrieve_data do
    r = GenStateMachine.call(DARWf, DARState.retrievingdata)
    DARWorkflow.process_message r
  end

  def process_image do
    r = GenStateMachine.call(DARWf, DARState.processingimage)
    DARWorkflow.process_message r
  end

  def create_document do
    r = GenStateMachine.call(DARWf, DARState.creatingdocument)
    DARWorkflow.process_message r
  end

  def validate_response do
    r = GenStateMachine.call(DARWf, DARState.validateresponse)
    DARWorkflow.process_message r
  end

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

  def handle_event({:call, from}, :retrievingdata, state, msg) do
    case DARWorkflowOperations.retrieve_data msg do
      {:ok, res} ->
        {:next_state, DARState.dataretrieved,
            %{msg | :state => DARState.dataretrieved, :metastruct => res},
            {:reply, from, %{msg | :state => DARState.dataretrieved, :metastruct => res}}}
      {_, err} ->
        {:next_state, DARState.errorstate,
            %{msg | :state => DARState.errorstate, :comment => err},
            {:reply, from, %{msg | :state => DARState.errorstate, :comment => err}}}
    end
  end

  def handle_event({:call, from}, :processingimage, state, msg) do
    case DARWorkflowOperations.process_image msg do
      {:ok, res} ->
        {:next_state, DARState.imageprocessed,
            %{msg | :state => DARState.imageprocessed, :images => res},
            {:reply, from, %{msg | :state => DARState.imageprocessed, :images => res}}}
      {_, err} ->
        {:next_state, DARState.errorstate,
            %{msg | :state => DARState.errorstate, :comment => err},
            {:reply, from, %{msg | :state => DARState.errorstate, :comment => err}}}
    end
  end

  def handle_event({:call, from}, :creatingdocument, state, msg) do
    case DARWorkflowOperations.create_document msg do
      {:ok, res} ->
        {:next_state, DARState.documentcreated,
            %{msg | :state => DARState.documentcreated, :gfsid => res},
            {:reply, from, %{msg | :state => DARState.documentcreated, :gfsid => res}}}
      {_, err} ->
        {:next_state, DARState.errorstate,
            %{msg | :state => DARState.errorstate, :comment => err},
            {:reply, from, %{msg | :state => DARState.errorstate, :comment => err}}}
    end
  end

  def handle_event({:call, from}, :validateresponse, state, msg) do
    case DARWorkflowOperations.validate_response msg do
      {:ok, res} ->
        {:next_state, DARState.requestprocessed,
            %{msg | :state => DARState.requestprocessed},
            {:reply, from, %{msg | :state => DARState.requestprocessed}}}
      {_, err} ->
        {:next_state, DARState.errorstate,
            %{msg | :state => DARState.errorstate, :comment => err},
            {:reply, from, %{msg | :state => DARState.errorstate, :comment => err}}}
    end
  end

  def handle_event(event_type, event_content, state, data) do
    # Call the default implementation from GenStateMachine
    super(event_type, event_content, state, data)
  end
end
