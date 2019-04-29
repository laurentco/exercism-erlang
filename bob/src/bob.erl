-module(bob).

-export([response/1]).

response(String) ->
  case analyse(String) of
    {yelling, question} -> "Calm down, I know what I'm doing!";
    {yelling, _}        -> "Whoa, chill out!";
    {_, question}       -> "Sure.";
    {_, nothing}        -> "Fine. Be that way!";
    _                   -> "Whatever."
  end.

% returns {Tone,Type} of a String utterance
% Tone = yelling | neutral
% Type = nothing | question | statement
analyse(String) ->
  IsNothing  = re:run(String, "^\\s*$") =/= nomatch,
  IsQuestion = re:run(String, "\\?\\s*$") =/= nomatch,

  Type = if
           IsNothing  -> nothing;
           IsQuestion -> question;
           true       -> statement
   end,

  Tone = case is_yelling(String) of
           true -> yelling;
           _    -> neutral
         end,

  {Tone, Type}.

is_yelling(String) -> some_uppercase(String) andalso no_lowercase(String).

some_uppercase(String) -> re:run(String, "[A-Z]") =/= nomatch.

no_lowercase(String) -> re:run(String, "[a-z]") =:= nomatch.
