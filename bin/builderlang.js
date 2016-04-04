#! /usr/local/bin/node
var shell = require("shelljs");

shell.echo('Running rebar3 for Erlang');
shell.exec('rebar3 version');
shell.cd('Erlang/erlangexamples');
// shell.exec('ls');
shell.exec("rebar3 compile");
shell.exec("rebar3 eunit")
shell.echo('End running rebar3 for Erlang');
