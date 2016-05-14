options = [
    trace: true,
    capture_log: true,
    exclude: [wip: true]
]

ExUnit.configure(options)
ExUnit.start()

case :gen_tcp.connect('localhost', 27017, []) do
  {:ok, socket} ->
    :gen_tcp.close(socket)
  {:error, reason} ->
    Mix.raise "Cannot connect to MongoDB" <>
              " #{:inet.format_error(reason)}"
end
