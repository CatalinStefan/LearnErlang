-module(age).

%% API
-export([getAge/1]).

getAge(Name) ->
  AgeMap = #{"Alice" => 23, "Bob" => 25, "Carol" => 29},
  maps:get(Name, AgeMap, -1).