-module(strain).

-export([keep/2, discard/2]).

keep(Fn, List) -> filter(Fn, List).

discard(Fn, List) -> keep(fun(E) -> not(Fn(E)) end, List).

filter(Fn, List) -> lists:reverse(filter(Fn, List, [])).

filter(_, [], List) -> List;
filter(Fn, [Element | List], Filtered) ->
  case Fn(Element) of
    true  -> filter(Fn, List, [Element | Filtered]);
    false -> filter(Fn, List, Filtered)
  end.

