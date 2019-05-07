-module(space_age).

-export([age/2]).

-define(EARTH_YEAR_SECONDS, 31557600).

-define(MERCURY_EARTH_ORB_PERIOD, 0.2408467).
-define(VENUS_EARTH_ORB_PERIOD, 0.61519726).
-define(MARS_EARTH_ORB_PERIOD, 1.8808158).
-define(JUPITER_EARTH_ORB_PERIOD, 11.862615).
-define(SATURN_EARTH_ORB_PERIOD, 29.447498).
-define(URANUS_EARTH_ORB_PERIOD, 84.016846).
-define(NEPTUNE_EARTH_ORB_PERIOD, 164.79132).

age(earth, Seconds)   -> Seconds / ?EARTH_YEAR_SECONDS;
age(mercury, Seconds) -> age(earth, Seconds) / ?MERCURY_EARTH_ORB_PERIOD;
age(venus, Seconds)   -> age(earth, Seconds) / ?VENUS_EARTH_ORB_PERIOD;
age(mars, Seconds)    -> age(earth, Seconds) / ?MARS_EARTH_ORB_PERIOD;
age(jupiter, Seconds) -> age(earth, Seconds) / ?JUPITER_EARTH_ORB_PERIOD;
age(saturn, Seconds)  -> age(earth, Seconds) / ?SATURN_EARTH_ORB_PERIOD;
age(uranus, Seconds)  -> age(earth, Seconds) / ?URANUS_EARTH_ORB_PERIOD;
age(neptune, Seconds) -> age(earth, Seconds) / ?NEPTUNE_EARTH_ORB_PERIOD.
