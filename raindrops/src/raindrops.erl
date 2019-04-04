-module(raindrops).

-export([convert/1]).

convert(Number) ->
  case [ Output || {Factor, Output} <- [{3,"Pling"}, {5,"Plang"}, {7, "Plong"}], Number rem Factor =:= 0] of
    []  -> integer_to_list(Number);
    Str -> lists:flatten(Str)
  end.