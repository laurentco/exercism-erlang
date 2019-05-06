-module(hamming).

-export([distance/2]).
-define(LENGTH_ERROR, {error, "left and right strands must be of equal length"}).

distance(Strand1, Strand2) -> distance(Strand1, Strand2, 0).

distance([E|Strand1], [E|Strand2], Distance) -> distance(Strand1, Strand2, Distance);
distance([_|Strand1], [_|Strand2], Distance) -> distance(Strand1, Strand2, Distance + 1);
distance([], [], Distance) -> Distance;
distance([], _, _) -> ?LENGTH_ERROR;
distance(_, [], _) -> ?LENGTH_ERROR.