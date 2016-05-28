%%%-------------------------------------------------------------------
%%% @author Wolfgang Loder
%%% @doc
%%% inets:start().
%%% browse http://localhost:4242/www/simplewebserver/service
%%% @end
%%%-------------------------------------------------------------------
-module(simplewebserver).

-export([start/0,service/3]).

start() ->
 inets:start(httpd, [
   {modules, [
    mod_alias,
    mod_auth,
    mod_esi,
    mod_actions,
    mod_cgi,
    mod_dir,
    mod_get,
    mod_head,
    mod_log,
    mod_disk_log
   ]},
  {port,4242},
  {server_name,"simplewebserver"},
  {server_root,"."},
  {document_root,"."},
  {erl_script_alias, {"/www", [simplewebserver,io]}},
  {error_log, "error.log"},
  {security_log, "security.log"},
  {transfer_log, "transfer.log"},
  {mime_types,[
   {"html","text/html"},
   {"css","text/css"},
   {"js","application/x-javascript"}
  ]}
 ]).

service(SessionID, _Env, _Input) ->
 mod_esi:deliver(SessionID, [
  "Content-Type: text/html\r\n\r\n",
  "<html><body>Hello, World!</body></html>"
 ]).
