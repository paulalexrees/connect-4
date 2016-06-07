def player_1_win_row
  game.take_turn(1)
  game.take_turn(1)
  game.take_turn(2)
  game.take_turn(2)
  game.take_turn(3)
  game.take_turn(3)
  game.take_turn(4)
end

def player_1_win_column
  game.take_turn(1)
  game.take_turn(2)
  game.take_turn(1)
  game.take_turn(2)
  game.take_turn(1)
  game.take_turn(2)
  game.take_turn(1)
end
