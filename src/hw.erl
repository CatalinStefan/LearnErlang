-module(hw).

%% API
-export([helloworld/0, helloworld/1]).

helloworld() ->
  "Hello world".

helloworld(X) ->
  "Hello " ++ X.