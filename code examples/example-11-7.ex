defmodule DARWorkflow do
  use Supervisor

  def process_message(m) do
    case m.state do
      :requestreceived ->
        DARWf.start_link m
        DARWf.new_request

      :requestvalidated ->
        DARWf.retrieve_data

      :dataretrieved ->
        if Enum.member?(m.actiongroups, DARActionGroup.images) do
          DARWf.process_image
        else
          if Enum.member?(m.actiongroups, DARActionGroup.document) do
            DARWf.create_document
          else
            DARWf.validate_response
          end
        end

      :imageprocessed ->
        if Enum.member?(m.actiongroups, DARActionGroup.document) do
          DARWf.create_document
        else
          DARWf.validate_response
        end

      :documentcreated ->
        DARWf.validate_response

      :requestprocessed ->
        DARWf.terminate
        DARModelResponseMessage.get_json m

      :errorstate ->
        DARWf.terminate
        DARModelInternalMessage.get_json m
    end
  end

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: {:global, __MODULE__})
  end

  def init(_opts) do
    children = [
      worker(DARImageLib,[DARImageLib]),
      worker(DARPdfLib,[DARPdfLib])
    ]
    supervise children, strategy: :one_for_one
  end
end
