defmodule DARWorkflowOperations do
  def validate_request msg do
    %{:name => pname} = msg
    %{:metaid => pgmetaid} = msg
    %{:actions => pactions} = msg
    p = {pname,pgmetaid,pactions}
    case p do
        {_,_,pactions} when pactions == [] -> {:error, "Actions list empty"}
        _ ->
          ag = []
          ag = if Enum.member?(msg.actions, DARAction.retrieveimage), do:  List.insert_at(ag, 0, DARActionGroup.images), else: ag
          ag = if Enum.member?(msg.actions, DARAction.retrievetext), do:  List.insert_at(ag, 0, DARActionGroup.document), else: ag
          {:ok, ag}
    end

  end

  def retrieve_data msg do
    if Enum.member?(msg.actions, DARAction.retrievedoclist_all) do
      metalist = DarMetaData.DataAccess.get_meta_all
      {:ok, DARModelMetaData.from_schema_list(metalist)}
    else
      if Enum.member?(msg.actions, DARAction.retrievedoc) do
        meta = DarMetaData.DataAccess.get_meta msg.metaid
        case m = List.first(meta) do
          nil ->
            {:error, "Retrieve Data error"}
          _ ->
            {:ok, DARModelMetaData.from_schema(m)}
        end
      end
    end
  end

  def process_image msg do
    metaimage = DarMetaData.DataAccess.get_imagemeta msg.metaid
    l = (for n <- metaimage, into:  [], do: n.id)
    res = DARImageLib.Process.process_message l
    {:ok, res}
  end

  def create_document msg do
    pdfid = DARPdfLib.process_message msg
    {:ok, pdfid}
  end

  def validate_response msg do
    {:ok, ""}
  end
end
