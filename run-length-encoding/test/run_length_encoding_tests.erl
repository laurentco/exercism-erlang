%% Based on canonical data version 1.1.0
%% https://github.com/exercism/problem-specifications/raw/master/exercises/run-length-encoding/canonical-data.json
%% This file is automatically generated from the exercises canonical data.

-module(run_length_encoding_tests).

-include_lib("erl_exercism/include/exercism.hrl").
-include_lib("eunit/include/eunit.hrl").




'1_empty_string_test'() ->
    ?assertEqual([], run_length_encoding:encode([])).

'2_single_characters_only_are_encoded_without_count_test'() ->
    ?assertEqual("XYZ", run_length_encoding:encode("XYZ")).

'3_string_with_no_single_characters_test'() ->
    ?assertEqual("2A3B4C",
		 run_length_encoding:encode("AABBBCCCC")).

'4_single_characters_mixed_with_repeated_characters_test'() ->
    ?assertEqual("12WB12W3B24WB",
		 run_length_encoding:encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWW"
					    "WWWWWWWB")).

'5_multiple_whitespace_mixed_in_string_test'() ->
    ?assertEqual("2 hs2q q2w2 ",
		 run_length_encoding:encode("  hsqq qww  ")).

'6_lowercase_characters_test'() ->
    ?assertEqual("2a3b4c",
		 run_length_encoding:encode("aabbbcccc")).

'7_empty_string_test'() ->
    ?assertEqual([], run_length_encoding:decode([])).

'8_single_characters_only_test'() ->
    ?assertEqual("XYZ", run_length_encoding:decode("XYZ")).

'9_string_with_no_single_characters_test'() ->
    ?assertEqual("AABBBCCCC",
		 run_length_encoding:decode("2A3B4C")).

'10_single_characters_with_repeated_characters_test'() ->
    ?assertEqual("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWW"
		 "WWWWWWWB",
		 run_length_encoding:decode("12WB12W3B24WB")).

'11_multiple_whitespace_mixed_in_string_test'() ->
    ?assertEqual("  hsqq qww  ",
		 run_length_encoding:decode("2 hs2q q2w2 ")).

'12_lower_case_string_test'() ->
    ?assertEqual("aabbbcccc",
		 run_length_encoding:decode("2a3b4c")).

'13_encode_followed_by_decode_gives_original_string_test'() ->
    ?assertEqual("zzz ZZ  zZ",
		 run_length_encoding:decode(run_length_encoding:encode("zzz ZZ  zZ"))).
