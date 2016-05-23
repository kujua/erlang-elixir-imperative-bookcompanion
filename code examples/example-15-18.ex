# https://github.com/elixir-lang/elixir/blob/master/lib/elixir/lib/inspect.ex
defprotocol Inspect do
  @fallback_to_any true
  def inspect(term, opts)
end
