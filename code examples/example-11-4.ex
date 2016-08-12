defmodule DARState do
  @idle :idle
  @requestreceived :requestreceived
  @requestvalidated :requestvalidated
  @retrievingdata :retrievingdata
  @dataretrieved :dataretrieved
  @processingimage :processingimage
  @imageprocessed :imageprocessed
  @creatingdocument :creatingdocument
  @documentcreated :documentcreated
  @validateresponse :validateresponse
  @requestprocessed :requestprocessed

  def idle do
    @idle
  end
  
  # truncated
end
