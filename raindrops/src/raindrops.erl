-module(raindrops).

-export([convert/1]).

convert(Number) ->
  case convert(Number, [{7, "Plong"}, {5,"Plang"}, {3,"Pling"}]) of
    []  -> integer_to_list(Number);
    Str -> lists:flatten(Str)
  end.

convert(Number, Factors) ->
  lists:foldl(
    fun
     ({Factor,Output},Str) when Number rem Factor =:= 0 -> [Output|Str];
     (_,Str) -> Str
    end,
    [],
    Factors
  ).