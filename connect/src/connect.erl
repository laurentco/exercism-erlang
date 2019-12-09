-module(connect).

-export([winner/1, top_to_bottom/2, to_bin/2]).

winner(Board) ->
  case is_connected(top_to_bottom(Board, $O)) of
    true  -> o;
    false ->
      case is_connected(left_to_right(Board, $X)) of
         true  -> x;
         false -> undefined
       end
  end.

is_connected([]) -> false;
is_connected([Positions1|Tail]) -> is_connected(Tail, Positions1).

is_connected(_, []) -> false;
is_connected([], _) -> true;
is_connected([Positions|Tail], Connections) -> is_connected(Tail, connections(Connections, Positions)).

top_to_bottom(Board, Token) -> [ to_bin(Row, Token) || Row <- Board ].

left_to_right(Board, Token) -> [ to_bin(Row, Token) || Row <- Board ].

position(Row, Token) -> position(Row, Token, [], 1).

position([], _, Positions, _) -> lists:reverse(Positions);
position([Token|Col], Token, Positions, Index) -> position(Col, Token, [Index|Positions], Index + 1);
position([$.|Col], Token, Positions, Index) -> position(Col, Token, Positions, Index + 1);
position([_|Col], Token, Positions, Index) -> position(Col, Token, Positions, Index).

connections(Previous, Current, Next) ->
  erlang:display(Positions1),
  erlang:display(Positions2),
  [ Pos2 || Pos2 <- Positions2, Pos1 <- Positions1, Pos2 >= Pos1 - 1, Pos2 =< Pos1 ].

to_bin(Str,Token) -> << B || B <- [ bin(A,Token) || A <- Str, A=/= 32 ] >>.

bin(A,A) -> <<1:1>>;
bin(_,_) -> <<0:1>>.
