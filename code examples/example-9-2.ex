defmodule SayHello do
@doc """
This module is a basic example of
  (1) sending messages between processes and
  (2) distribute processes on different machines.
Usage:
Machine 1: iex --sname precipient --cookie scookie
           SayHello.start_recipient
Machine 2: iex --sname pinit --cookie scookie
           Node.connect :"precipient@machinename"
           SayHello.start_sayhello
"""
def start_recipient do
  precipient = spawn(SayHello, :recipient, [])
  :global.register_name(:precipient, precipient)
end

def start_sayhello() do
  spawn(SayHello, :say_hello, ["Hello", 2])
  send :global.whereis_name(:precipient), :log
end

def say_hello(_, 0) do
  IO.puts "Process 'say_hello' finished"
  send :global.whereis_name(:precipient), :finished
end

def say_hello(what, times) do
  IO.puts what
  send :global.whereis_name(:precipient), what
  say_hello(what, times - 1)
end

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

def start do
  precipient = spawn(SayHello, :recipient, [])
  :global.register_name(:precipient, precipient)
  send precipient, :nomessagedefined
  spawn(SayHello, :say_hello, ["Hello", 4])
end

end
