-module(series).

-export([slices/2]).

slices(SliceLength, Series = [_|_]) when SliceLength =< length(Series) ->
  lists:reverse(slices(SliceLength, Series, length(Series) - SliceLength + 1, [])).

slices(_, _, 0, Acc) -> Acc;
slices(SliceLength, Series = [_|T], Count, Acc) ->
  slices(SliceLength, T, Count - 1, [lists:sublist(Series,SliceLength)|Acc]).