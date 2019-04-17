-module(rna_transcription).

-export([to_rna/1]).

to_rna(Strand) -> lists:map(fun compl/1, Strand).

compl($G) -> $C;
compl($C) -> $G;
compl($T) -> $A;
compl($A) -> $U.