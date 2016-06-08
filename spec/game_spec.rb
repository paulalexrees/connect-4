require 'helpers'

describe Game do

  let(:game) { described_class.new }
  let(:penultimate_row){ game.board.length - 2 }

  context 'When game starts' do

    it 'initializes with a 6x7 board' do
      expect(game.board.length).to eq 6
      expect(game.board.first.length).to eq 7
    end

    it 'starts with player 1\'s turn' do
      expect(game.current_turn).to eq 1
    end
  end

  context 'a token is placed' do

    before (:each) do
      game.take_turn(2)
    end

    it 'falls to the bottom of that column' do
      expect(game.board.last).to eq ['_','_','R','_','_','_','_']
    end

    it 'stacks on top of any previously dropped tokens in the same column' do
      game.take_turn(3)
      game.take_turn(2)
      expect(game.board[penultimate_row]).to eq ['_','_','R','_','_','_','_']
    end

    it 'dropping a token toggles to alternate player\'s turn' do
      expect(game.current_turn).to eq 2
    end

    it 'player 2 drops yellow tokens' do
      game.take_turn(2)
      expect(game.board[penultimate_row]).to eq ['_','_','Y','_','_','_','_']
    end
  end

  context 'determining 4 in a row' do

    it 'can find 4 in one row' do
      player_1_win_row
      expect(game.check_for_winner).to eq true
    end

    it 'can find 4 in one column' do
      player_1_win_column
      expect(game.check_for_winner).to eq true
    end

    it 'can find 4 diagonally left to right' do
      player_1_win_diagonal_left
      expect(game.check_for_winner).to eq true
    end

    it 'can find 4 diagonally right to left' do
      player_1_win_diagonal_right
      expect(game.check_for_winner).to eq true
    end

  end

end
