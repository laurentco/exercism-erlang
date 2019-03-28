-module(collatz_conjecture).

-export([steps/1]).

steps(N) when N =< 0              -> {error, "Only positive numbers are allowed"};
steps(N)                          -> steps(N,0).
steps(1, Count)                   -> Count;
steps(N, Count) when N rem 2 == 0 -> steps(N div 2, Count + 1);
steps(N, Count)                   -> steps(3 * N + 1, Count + 1).
