-module(temp).

%% API
-export([convert/2, convert/1]).

convert(F, fahrenheit) ->
  (F - 32) * 5 / 9;
convert(C, celsius) ->
  C * 9 / 5 + 32.

convert({fahrenheit, X}) ->
  Y = (X - 32) * 5 / 9,
  {celsius, Y};
convert({celsius, X}) ->
  Y = X * 5 / 9 + 32,
  {fahrenheit, Y}.