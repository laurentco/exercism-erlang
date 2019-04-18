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

analyse(String) ->
  WhiteSpaces = re:run(String, "^\\s*$"),
  Question    = re:run(String, "\\?\\s*$"),
  UpperCase   = re:run(String, "[A-Z]"),
  LowerCase   = re:run(String, "[a-z]"),
  What = if
           WhiteSpaces =/= nomatch -> nothing;
           Question    =/= nomatch -> question;
           true                    -> statement
   end,
  Tone = if
           (UpperCase =/= nomatch) and (LowerCase =:= nomatch) -> yelling;
           true                                                -> neutral
   end,
  {Tone, What}.

