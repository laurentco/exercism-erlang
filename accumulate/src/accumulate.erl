-module(accumulate).

-export([accumulate/2]).

accumulate(Fn, Ls)         -> accumulate(fun(A) -> A end, accumulate(Fn, Ls, []), []).
accumulate(_, [], Acc)     -> Acc;
accumulate(Fn, [H|T], Acc) -> accumulate(Fn, T, [Fn(H)|Acc]).
