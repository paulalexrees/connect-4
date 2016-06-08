class Game

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

  def board
    @board.dup
  end

private

  def check_rows
    board.each do |row|
      row.each_cons(4) do |slice|
        return true if slice.uniq == ["R"]
      end
    end
    false
  end

  def check_columns(temp_board = board)
    temp_board.transpose.each do |row|
      row.each_cons(4) do |slice|
        return true if slice.uniq == ["R"]
      end
    end
    false
  end

  def check_diagonals
    check_columns(offset_left_diagonals) || check_columns(offset_right_diagonals)
  end

  def offset_left_diagonals
    temp_board = board
    offset = temp_board.length - 1
    for i in 0..offset do
      (offset-i).times { temp_board[i].insert(0,("X")) }
      (i).times { temp_board[i] << "X" }
    end
    temp_board
  end

  def offset_right_diagonals
    temp_board = board
    offset = temp_board.length - 1
    for i in 0..offset do
      (offset-i).times { temp_board[i] << "X" }
      (i).times { temp_board[i].insert(0,("X")) }
    end
    temp_board
  end

  def index_of_first_blank(column)
    get_column_as_array(column).reverse.find_index("_")
  end

  def get_column_as_array(column)
    board.map { |row| row[column] }
  end

  def switch_turns
    @player_1_turn = !@player_1_turn
  end

  def drop_token(column, colour)
    @board[@board.length - index_of_first_blank(column) - 1][column] = colour
  end


end
