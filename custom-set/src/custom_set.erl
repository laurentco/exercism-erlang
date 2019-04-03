-module(custom_set).

-export([add/2, add2/2, contains/2, difference/2, disjoint/2, empty/1, equal/2, from_list/1, intersection/2, subset/2,
	 union/2]).

add(Elem, []) -> [Elem];
add(Elem1, [Elem2 | Set]) when Elem1 > Elem2 -> [Elem2 | add(Elem1, Set)];
add(Elem1, Set = [Elem2 | _]) when Elem1 < Elem2 -> [Elem1 | Set];
add(_, Set) -> Set.

%% CPS version
add2(Elem, []) -> [Elem];
add2(Elem, Set) -> add2(Elem, Set, fun(S) -> S end).
add2(Elem1, [Elem2 | Set], LeftFn) when Elem1 > Elem2 -> add2(Elem1, Set, fun(S) -> LeftFn([Elem2 | S]) end);
add2(Elem1, Set = [Elem2 | _], LeftFn) when Elem1 < Elem2 -> LeftFn([Elem1 | Set]);
add2(_, Set, LeftFn) -> LeftFn(Set).

contains(Elem, [Elem | _]) -> true;
contains(Elem1, [Elem2 | Others]) when Elem1 > Elem2 -> contains(Elem1, Others);
contains(_, _) -> false.

disjoint(Set1, Set2) ->
	intersection(Set1, Set2) == [].

difference(Set1, Set2) ->
	fold_sets(Set1, Set2,
		fun(_, Acc) -> Acc end,
		fun(left, Elem, Acc) -> [Elem | Acc];
			 (right, _, Acc) -> Acc
		end,
		[]
	).

empty([]) -> true;
empty(_)  -> false.

equal(Set, Set) -> true;
equal(_, _)     -> false.

from_list(List) when is_list(List) ->
	lists:usort(List).

intersection(Set1, Set2) ->
	fold_sets(Set1, Set2,
		fun(Elem, Acc) -> [Elem | Acc] end,
		fun(_, _, Acc) -> Acc end,
		[]
	).

subset(Set1, Set2) ->
	intersection(Set1, Set2) == Set1.

union(Set1, Set2) ->
	fold_sets(Set1, Set2,
		fun(Elem, Acc) -> [Elem | Acc] end,
		fun(_, Elem, Acc) -> [Elem | Acc] end,
		[]
	).

fold_sets([]            , []                , _ , _   , Acc)                    -> lists:reverse(Acc);
fold_sets([Elem | Set1] , [Elem | Set2]     , Eq, Diff, Acc)                    -> fold_sets(Set1, Set2, Eq, Diff, Eq(Elem, Acc));
fold_sets([Elem | Set]  , []                , Eq, Diff, Acc)                    -> fold_sets(Set, []   , Eq, Diff, Diff(left, Elem, Acc));
fold_sets([]            , [Elem | Set]      , Eq, Diff, Acc)                    -> fold_sets([], Set   , Eq, Diff, Diff(right, Elem, Acc));
fold_sets([Elem1 | Set1], Set2 = [Elem2 | _], Eq, Diff, Acc) when Elem1 < Elem2 -> fold_sets(Set1, Set2, Eq, Diff, Diff(left, Elem1, Acc));
fold_sets(Set1, [Elem2 | Set2]              , Eq, Diff, Acc)                    -> fold_sets(Set1, Set2, Eq, Diff, Diff(right, Elem2, Acc)).
