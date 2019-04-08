-module(series).

-export([slices/2]).

slices(SliceLength, Series = [_|_])  ->
  slices(SliceLength, Series, length(Series)).

slices(SliceLength, Series, SeriesLength) when SliceLength =< SeriesLength ->
  slices(SliceLength, Series, SeriesLength - SliceLength + 1, []).

slices(_, _, 0, Acc) -> lists:reverse(Acc);
slices(SliceLength, Series = [_|T], Count, Acc) ->
  slices(SliceLength, T, Count - 1, [lists:sublist(Series,SliceLength)|Acc]).