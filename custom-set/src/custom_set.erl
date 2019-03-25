-module(custom_set).

-export([add/2, contains/2, difference/2, disjoint/2, empty/1, equal/2, from_list/1, intersection/2, subset/2,
	 union/2]).


add(Elem, Set) ->
	case contains(Elem, Set) of
		true  -> Set;
	  false -> [Elem | Set]
  end.

contains(Elem, Set) ->
	lists:any(fun(Item) -> Item == Elem end, Set).

disjoint(Set1, Set2) ->
	intersection(Set1, Set2) == [].

difference(Set1, Set2) ->
	lists:filter(fun(Item) -> not contains(Item, Set2) end, Set1).

empty([]) -> true;
empty(_)  -> false.

equal(Set1, Set2) ->
	subset(Set1, Set2) and subset(Set2, Set1).

from_list(List) when is_list(List) ->
	lists:foldl(fun add/2, [], List).

intersection(Set1, Set2) ->
	lists:filter(fun(Item) -> contains(Item, Set2) end, Set1).

subset(Set1, Set2) ->
	lists:all(fun(Item) -> contains(Item, Set2) end, Set1).

union(Set1, Set2) ->
	lists:foldl(fun add/2, Set1, Set2).