class Game

  attr_reader :board

  def initialize
    @player_1_turn = true
    @board = [['_','_','_','_','_','_'],
              ['_','_','_','_','_','_'],
              ['_','_','_','_','_','_'],
              ['_','_','_','_','_','_'],
              ['_','_','_','_','_','_'],
              ['_','_','_','_','_','_'],
              ['_','_','_','_','_','_']]

  end

  def take_turn(column)
    @player_1_turn ? drop_token(column, 'R') : drop_token(column, 'Y')
    switch_turns
  end

  def current_turn
    @player_1_turn ? 1 : 2
  end

private

  def index_of_first_blank(column)
    @board[column].find_index("_")
  end

  def switch_turns
    @player_1_turn = !@player_1_turn
  end

  def drop_token(column, colour)
    @board[column][index_of_first_blank(column)] = colour
  end





end
