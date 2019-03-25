-module(leap).

-export([leap_year/1]).

leap_year(_Year) when is_integer(_Year) ->
  if _Year rem 400 == 0 -> true;
     _Year rem 100 == 0 -> false;
     _Year rem 4   == 0 -> true;
     true               -> false
  end.
