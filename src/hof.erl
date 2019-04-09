-module(hof).

%% API
-export([double/0]).

double() ->
  F = fun(X) -> (X - 32) * 5 / 9 end,
  map(F, [1, 5, 2, 7, 4, 6]).

map(F, []) ->
  [];
map(F, [First | Rest]) ->
  [F(First) | map(F, Rest)].