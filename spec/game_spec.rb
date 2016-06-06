describe Game do

  let(:game) { described_class.new }

  context 'When game starts' do

    it 'initializes with a 6x7 board' do
      expect(game.board.length).to eq 7
      expect(game.board.first.length).to eq 6
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
      expect(game.board[2]).to eq ['R','_','_','_','_','_']
    end

    it 'stacks on top of any previously dropped tokens in the same column' do
      game.take_turn(3)
      game.take_turn(2)
      expect(game.board[2]).to eq ['R','R','_','_','_','_']
    end

    it 'dropping a token toggles to alternate player\'s turn' do
      expect(game.current_turn).to eq 2
    end

    it 'player 2 drops yellow tokens' do
      game.take_turn(2)
      expect(game.board[2]).to eq ['R','Y','_','_','_','_']
    end
  end

  context 'winning a game' do

    it 'player 1 successful connect_4' do
      game.take_turn(1)
      game.take_turn(2)
      game.take_turn(1)
      game.take_turn(2)
      game.take_turn(1)
      game.take_turn(2)
      game.take_turn(1)
      expect(game.complete).to eq true
    end
  end
end
