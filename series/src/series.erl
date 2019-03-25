-module(series).

-export([slices/2]).

slices(SliceLength, Series = [_|_]) when SliceLength =< length(Series), SliceLength > 0 ->
  lists:reverse(slices(SliceLength, Series, [])).

slices(_, [],Acc) -> Acc;
slices(SliceLength, Series = [_|T], Acc) ->
  case takeN(SliceLength, Series) of
    Slice when length(Slice) == SliceLength -> slices(SliceLength, T, [Slice|Acc]);
                                          _ -> Acc
  end.

takeN(N, List) -> lists:reverse(takeN(N, List, [])).
takeN(N, [Take|List], Taken) when N > 0 -> takeN(N-1, List, [Take|Taken]);
takeN(_, _, Taken) -> Taken.