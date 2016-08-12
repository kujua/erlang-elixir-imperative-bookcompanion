-module(lazyeval).
-export([from/1,filter/2,sift/2,sieve/1,primes/0, first/1]).

%% This generates a lazy sequence starting from K.
%% from(K) ->
%%    fun() ->
%%	    [K| from(K+1)]
%%    end.

from(K) -> [K|fun()->from(K+1)end].


%% This applies the Pred to each element of the list and returns a list
%% containing those elements which satisfies Pred.

filter(Pred,[]) -> [];
filter(Pred,[H|Tl]) ->
	  case Pred(H) of
	      true ->
		     [H|fun() -> filter(Pred,Tl()) end];
              false ->
		  filter(Pred,Tl())
          end.

%% This function simply calls filter/2.
sift(P,L) -> filter(fun(N) -> N rem P /= 0 end,L).

%% This generates a lazy list after removing all the multiples of H.
sieve([H|Tl]) ->
	[H|fun() -> sieve(sift(H,Tl())) end].


%% This generates the list of prime numbers.
primes() -> sieve(from(2)).

first(N) -> first(N, primes()).

first(0, _) -> true;
first(N, [X|P]) ->
	io:format("generated:~p~n",[X]),
	P1 = P(),
	first(N-1, P1).
