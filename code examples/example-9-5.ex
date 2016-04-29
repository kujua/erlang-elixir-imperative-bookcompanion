# recipient of say_hello-messages
def recipient do
  receive do
    :finished ->
      IO.puts "Recipient process finished"
    :log ->
      IO.puts "Recipient received log message"
      recipient
    what ->
      IO.puts "Recipient received #{what}"
      recipient
  end
end
