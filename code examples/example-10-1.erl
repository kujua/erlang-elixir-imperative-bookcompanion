-module(rawudp).

-export([start/1, client/2]).

start(Port) ->
  {ok, Socket} = gen_udp:open(Port, [binary, {active, false}]),
    io:format("server opened socket:~p~n",[Socket]),
    loop(Socket).

loop(Socket) ->
  inet:setopts(Socket, [{active, once}]),
  receive
      {udp, Socket, Host, Port, Bin} ->
          io:format("server received:~p~n",[Bin]),
          gen_udp:send(Socket, Host, Port, <<"From Server:", Bin/binary>>),
          case Bin of
            <<"stop">> -> gen_udp:close(Socket);
            _ -> loop(Socket)
          end
  end.

client(N, Port) ->
    {ok, Socket} = gen_udp:open(0, [binary]),
    io:format("client opened socket=~p~n",[Socket]),
    ok = gen_udp:send(Socket, "localhost", Port, N),
    Value = receive
                {udp, Socket, _, _, Bin} ->
                    io:format("client received:~p~n",[Bin])
            after 1000 ->
                    0
            end,
    gen_udp:close(Socket),
    Value.
