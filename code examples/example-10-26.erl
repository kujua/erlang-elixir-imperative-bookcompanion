% /test?testmode=get_apiassets&paged=true&page=2
{AllValues, _} = cowboy_req:qs_vals(Req).
% [
%   {<<"testmode">>,<<"get_apiassets">>},
%   {<<"paged">>,<<"true">>},
%   {<<"page">>,<<"2">>}
% ]
