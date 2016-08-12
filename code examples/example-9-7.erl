J = rpc:call(
  'dblib@localhost',
  'Elixir.DarDblib',
  write_meta_to_collection,
  [M]).
