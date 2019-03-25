-module(custom_set).

-export([add/2, contains/2, difference/2, disjoint/2, empty/1, equal/2, from_list/1, intersection/2, subset/2,
	 union/2]).


add(_Elem, _Set) ->
	case contains(_Elem, _Set) of
		true  -> _Set;
	  false -> [_Elem | _Set]
  end.

contains(_Elem, _Set) ->
	lists:any(fun(_Item) -> _Item == _Elem end, _Set).

disjoint(_Set1, _Set2) ->
	intersection(_Set1, _Set2) == [].

difference(_Set1, _Set2) ->
	lists:filter(fun(_Item) -> not contains(_Item, _Set2) end, _Set1).

empty([]) -> true;
empty(_)  -> false.

equal(_Set1, _Set2) ->
	subset(_Set1, _Set2) and subset(_Set2, _Set1).

from_list(_List) when is_list(_List) ->
	lists:foldl(fun add/2, [], _List).

intersection(_Set1, _Set2) ->
	lists:filter(fun(_Item) -> contains(_Item, _Set2) end, _Set1).

subset(_Set1, _Set2) ->
	lists:all(fun(_Item) -> contains(_Item, _Set2) end, _Set1).

union(_Set1, _Set2) ->
	lists:foldl(fun add/2, _Set1, _Set2).