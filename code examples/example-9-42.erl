new_uuid(Pid) ->
  U = uuid:new(Pid),
  {UU,_} = uuid:get_v1(U),
  uuid:uuid_to_string(UU,standard).
