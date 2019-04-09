-module(rna_transcription).

-export([to_rna/1]).

to_rna(Strand) -> lists:flatten([compl([X]) || X <- Strand]).

compl("G") -> "C";
compl("C") -> "G";
compl("T") -> "A";
compl("A") -> "U";
compl(T) -> T.