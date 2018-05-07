require 'world'
require 'board'

describe World do
  let(:board) { Board.new(initial_state: initial_state) }
  subject(:world) do
    World.new(initial_state: initial_state, board: board, dimensions: [5, 5])
  end

  describe '#generation' do
    it 'starts out at 0' do
      expect(world.generation).to eq(0)
    end
  end

  describe '#tick!' do
    it 'increments generation' do
      world.tick!
      expect(world.generation).to eq(1)
      world.tick!
      expect(world.generation).to eq(2)
    end

    context "when cells don't wrap around" do
      it 'modifies world according to rules' do
        world.tick!
        board = world.send(:board)

        true_coordinates = [[0, 1], [1, 2], [1, 3], [2, 1], [2, 2]]
        check_live_at(board, true_coordinates)
      end
    end
    context 'when cells do wrap around' do
      it 'modifies world according to rules, wrapping cells around' do
        world.tick!
        world.tick!

        true_coordinates = [[0, 2], [1, 3], [2, 1], [2, 2], [2, 3]]
        check_live_at(board, true_coordinates)
      end
    end
  end
end
