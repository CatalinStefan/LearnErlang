-module(talk).

%% API
-export([run/0, alice/0, bob/2, startAlice/0, startBob/1]).

alice() ->
  receive
    {message, BobNode} ->
      io:fwrite("Alice got a message\n"),
      BobNode ! message,
      alice();
    finished -> io:fwrite("Alice is finished\n")
  end.

bob(0, AliceNode) ->
  {alice, AliceNode} ! finished,
  io:fwrite("Bob is finished\n");

bob(N, AliceNode) ->
  {alice, AliceNode} ! {message, self()},
  receive
    message -> io:fwrite("Bob got a message\n")
  end,
  bob(N-1, AliceNode).

run() ->
  register(alice, spawn(talk, alice, [])),
  register(bob, spawn(talk, bob, [3])).

startAlice() ->
  register(alice, spawn(talk, alice, [])).

startBob(AliceNode) ->
  spawn(talk, bob, [3, AliceNode]).