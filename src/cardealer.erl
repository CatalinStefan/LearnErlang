-module(cardealer).

%% API
-export([listPrices/1]).

listPrices(Currency) ->
  CarList = getCarList(),
  printPrice(CarList, Currency).

printPrice([], Currency) ->
  true;
printPrice([Car | Rest], Currency) ->
  CarMap = getCarMap(),
  Price = maps:get(Car, CarMap),
  ConvertedPrice = convertPrice(Price, Currency),
  io:fwrite("The price for " ++ Car ++ " is " ++ integer_to_list(ConvertedPrice) ++ "\n"),
  printPrice(Rest, Currency).

convertPrice(Price, Currency) ->
  case Currency of
    eur -> round(Price * 0.9);
    gbp -> round(Price * 0.75);
    usd -> Price
  end.

getCarList() ->
  ["BMW i8", "Laborghini Huracan", "Ferrari f12"].

getCarMap() ->
  #{"BMW i8" => 150000, "Laborghini Huracan" => 500000, "Ferrari f12" => 700000}.