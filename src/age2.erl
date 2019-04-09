-module(age2).

%% API
-export([getType/1]).

getType(N) when N < 13 ->
  child;
getType(N) when N < 18 ->
  teen;
getType(N) when N > 17 ->
  adult.