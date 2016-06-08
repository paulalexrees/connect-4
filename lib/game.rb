class Game

  attr_reader :board

  def initialize
    @player_1_turn = true
    @board = [['_','_','_','_','_','_','_'],
              ['_','_','_','_','_','_','_'],
              ['_','_','_','_','_','_','_'],
              ['_','_','_','_','_','_','_'],
              ['_','_','_','_','_','_','_'],
              ['_','_','_','_','_','_','_']]

  end

  def take_turn(column)
    @player_1_turn ? drop_token(column, 'R') : drop_token(column, 'Y')
    switch_turns
  end

  def current_turn
    @player_1_turn ? 1 : 2
  end

  def check_for_winner
    check_rows || check_columns || check_diagonals
  end

private

  def check_rows
    @board.each do |row|
      row.each_cons(4) do |slice|
        return true if slice.uniq == ["R"]
      end
    end
    false
  end

  def check_columns(board = @board)
    board.transpose.each do |row|
      row.each_cons(4) do |slice|
        return true if slice.uniq == ["R"]
      end
    end
    false
  end

  def check_diagonals
    offset = @board.length - 1
    board = @board
    for i in 0..offset do
      (offset-i).times { board[i].insert(0,("X")) }
      (i).times { board[i] << "X" }
    end
    check_columns(board)
  end

  def index_of_first_blank(column)
    get_column_as_array(column).reverse.find_index("_")
  end

  def get_column_as_array(column)
    @board.map { |row| row[column] }
  end

  def switch_turns
    @player_1_turn = !@player_1_turn
  end

  def drop_token(column, colour)
    @board[@board.length - index_of_first_blank(column) - 1][column] = colour
  end


end
