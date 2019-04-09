-module(cal).

%% API
-export([leap/1, day/2]).

leap(Year) ->
  if
    Year rem 400 == 0 -> leap;
    Year rem 100 == 0 -> non_leap;
    Year rem 4 == 0 -> leap;
    true -> non_leap
  end.

day(Month, Year) ->
  Leap = leap(Year),
  case Month of
    jan -> 31;
    feb when Leap == leap -> 29;
    feb -> 28;
    mar -> 31;
    apr -> 30;
    may -> 31;
    jun -> 30;
    jul -> 31;
    aug -> 31;
    sep -> 30;
    oct -> 31;
    nov -> 30;
    dec -> 31
  end.