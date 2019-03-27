-module(roman_numerals).

-export([roman/1]).

roman(0) -> "";
roman(Number) when Number =< 3999 -> concat(roman(Number, [{1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"}, {100, "C"}, {90, "XC"}, {50, "L"}, {40, "XL"}, {10, "X"}, {9, "IX"}, {5, "V"}, {4, "IV"}, {1, "I"}], [])).

roman(_, [], Acc)                                                          -> Acc;
roman(Number, Numerals = [{Value, Numeral} | _], Acc) when Number >= Value -> roman(Number - Value, Numerals, [Numeral | Acc]);
roman(Number, [_ | Numerals], Acc)                                         -> roman(Number, Numerals, Acc).

concat(List)         -> concat(List, []).
concat([], Acc)      -> Acc;
concat([H | T], Acc) -> concat(T, H ++ Acc).