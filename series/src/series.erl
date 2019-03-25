-module(series).

-export([slices/2]).

slices(_SliceLength, _Series = [_|_]) when _SliceLength =< length(_Series), _SliceLength > 0 ->
  lists:reverse(slices(_SliceLength, _Series, [])).

slices(_, [],_Acc) -> _Acc;
slices(_SliceLength, _Series = [_|T],_Acc) ->
  case takeN(_SliceLength, _Series) of
    Slice when length(Slice) == _SliceLength -> slices(_SliceLength, T, [Slice|_Acc]);
                                           _ -> _Acc
  end.

takeN(N, List) -> lists:reverse(takeN(N, List, [])).
takeN(N, [Take|List], Taken) when N > 0 -> takeN(N-1, List, [Take|Taken]);
takeN(_, _, Taken) -> Taken.