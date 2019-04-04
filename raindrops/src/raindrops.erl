-module(raindrops).

-define(FACTORS, [{3,"Pling"}, {5,"Plang"}, {7, "Plong"}]).
-export([convert/1]).

convert(Number) ->
  case [ Output || {Factor, Output} <- ?FACTORS, Number rem Factor =:= 0] of
    []  -> integer_to_list(Number);
    Str -> lists:flatten(Str)
  end.