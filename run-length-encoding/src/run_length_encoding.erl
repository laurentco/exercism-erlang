-module(run_length_encoding).

-export([decode/1, encode/1]).
-import(string, [slice/3]).
-define(RLE_REGEX, "(\\d*)([A-Za-z\\s])").

decode([]) -> [];
decode(String) -> lists:flatmap(fun decode_token/1, lists:reverse(decode(String, []))).

decode([], Tokens) -> Tokens;
decode(String, Tokens) ->
  case re:run(String, ?RLE_REGEX) of
    {match, [ {_,L}, {F1,L1}, {F2,L2}]} ->
      Count    = case slice(String, F1, L1) of
                   [] -> 1;
                   C  -> list_to_integer(C)
                 end,
      [Char|_] = slice(String, F2, L2),
      Next     = slice(String, L, length(String) - L),
      decode(Next, [{Char,Count} | Tokens])
  end.

decode_token({Char,Count}) -> io_lib:format("~.*.~c",[Count, Char]).

encode([]) -> [];
encode([Char|Input]) -> lists:flatmap(fun encode_token/1, lists:reverse(encode(Input, Char, 1, []))).

encode([Char|Input], Char, Count, Output) -> encode(Input, Char, Count + 1, Output);
encode([C|Input], Char, Count, Output) -> encode(Input, C, 1, [{Char,Count} | Output]);
encode([], Char, Count, Output) -> [ {Char,Count} | Output].

encode_token({Char, 1}) -> [Char];
encode_token({Char, Count}) -> io_lib:format("~B~c", [Count, Char]).
