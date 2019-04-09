-module(greet).

%% API
-export([greet/1]).

greet([]) ->
  true;

greet([First | Rest]) ->
  io:fwrite("Hello " ++ First ++ "\n"),
  greet(Rest).