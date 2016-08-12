defmodule DARModelInternalMessage do
  defstruct gfsid:        "",
            name:         "",
            comment:      "",
            has_pdf:      false,
            state:        DARState.requestreceived,
            actions:      [DARState.retrievingdata],
            images:       %DARModelImageProcessing{}
end
