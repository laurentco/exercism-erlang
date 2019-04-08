-module(dominoes).

-export([can_chain/1]).

can_chain([]) -> true;
can_chain({A,B}) -> A == B;
can_chain(L) -> [ P || P <- perms(L), is_chain(P)] =/= [].

is_chain([H|T]) ->
  case lists:foldl(fun place/2, H, T) of
    {A,A} -> true;
    _     -> false
  end.

place({A,X}, {A,Y}) -> {X,Y};
place({X,A}, {A,Y}) -> {X,Y};
place({A,X}, {Y,A}) -> {X,Y};
place({X,A}, {Y,A}) -> {X,Y};
place(_, _) -> {}.

perms([]) -> [[]];
perms(L)  -> [[H|T] || H <- L, T <- perms(L--[H])].
