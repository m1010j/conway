require 'world'
require 'board'

describe World do
  
  let(:initial_state) {
    [
      [:dead, :live, :dead, :dead, :dead],
      [:dead, :dead, :live, :dead, :dead],
      [:live, :live, :live, :dead, :dead],
      [:dead, :dead, :dead, :dead, :dead],
      [:dead, :dead, :dead, :dead, :dead],
    ]
  }
  let(:board) { Board.new(initial_state: initial_state) }
  subject(:world) { World.new(
    initial_state: initial_state,
    board: board,
    dimensions: [5, 5]
  ) }
  let(:location_0_0) { double("Location 0, 0", coordinate: [0, 0]) }
  let(:location_0_1) { double("Location 0, 1", coordinate: [0, 1]) }
  let(:location_0_2) { double("Location 0, 2", coordinate: [0, 2]) }
  let(:location_0_3) { double("Location 0, 3", coordinate: [0, 3]) }
  let(:location_0_4) { double("Location 0, 4", coordinate: [0, 4]) }
  let(:location_1_0) { double("Location 1, 0", coordinate: [1, 0]) }
  let(:location_1_1) { double("Location 1, 1", coordinate: [1, 1]) }
  let(:location_1_2) { double("Location 1, 2", coordinate: [1, 2]) }
  let(:location_1_3) { double("Location 1, 3", coordinate: [1, 3]) }
  let(:location_1_4) { double("Location 1, 4", coordinate: [1, 4]) }
  let(:location_2_0) { double("Location 2, 0", coordinate: [2, 0]) }
  let(:location_2_1) { double("Location 2, 1", coordinate: [2, 1]) }
  let(:location_2_2) { double("Location 2, 2", coordinate: [2, 2]) }
  let(:location_2_3) { double("Location 2, 3", coordinate: [2, 3]) }
  let(:location_2_4) { double("Location 2, 4", coordinate: [2, 4]) }
  let(:location_3_0) { double("Location 3, 0", coordinate: [3, 0]) }
  let(:location_3_1) { double("Location 3, 1", coordinate: [3, 1]) }
  let(:location_3_2) { double("Location 3, 2", coordinate: [3, 2]) }
  let(:location_3_3) { double("Location 3, 3", coordinate: [3, 3]) }
  let(:location_3_4) { double("Location 3, 4", coordinate: [3, 4]) }
  let(:location_4_0) { double("Location 4, 0", coordinate: [4, 0]) }
  let(:location_4_1) { double("Location 4, 1", coordinate: [4, 1]) }
  let(:location_4_2) { double("Location 4, 2", coordinate: [4, 2]) }
  let(:location_4_3) { double("Location 4, 3", coordinate: [4, 3]) }
  let(:location_4_4) { double("Location 4, 4", coordinate: [4, 4]) }

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
        expect(board.live_at?(location_0_0)).to be(false)
        expect(board.live_at?(location_0_1)).to be(true)
        expect(board.live_at?(location_0_2)).to be(false)
        expect(board.live_at?(location_0_3)).to be(false)
        expect(board.live_at?(location_0_4)).to be(false)
        expect(board.live_at?(location_1_0)).to be(false)
        expect(board.live_at?(location_1_1)).to be(false)
        expect(board.live_at?(location_1_2)).to be(true)
        expect(board.live_at?(location_1_3)).to be(true)
        expect(board.live_at?(location_1_4)).to be(false)
        expect(board.live_at?(location_2_0)).to be(false)
        expect(board.live_at?(location_2_1)).to be(true)
        expect(board.live_at?(location_2_2)).to be(true)
        expect(board.live_at?(location_2_3)).to be(false)
        expect(board.live_at?(location_2_4)).to be(false)
        expect(board.live_at?(location_3_0)).to be(false)
        expect(board.live_at?(location_3_1)).to be(false)
        expect(board.live_at?(location_3_2)).to be(false)
        expect(board.live_at?(location_3_3)).to be(false)
        expect(board.live_at?(location_3_4)).to be(false)
        expect(board.live_at?(location_4_0)).to be(false)
        expect(board.live_at?(location_4_1)).to be(false)
        expect(board.live_at?(location_4_2)).to be(false)
        expect(board.live_at?(location_4_3)).to be(false)
        expect(board.live_at?(location_4_4)).to be(false)
      end
    end
    context "when cells do wrap around" do
      it 'modifies world according to rules, wrapping cells around' do
        world.tick!
        world.tick!
        expect(board.live_at?(location_0_0)).to be(false)
        expect(board.live_at?(location_0_1)).to be(false)
        expect(board.live_at?(location_0_2)).to be(true)
        expect(board.live_at?(location_0_3)).to be(false)
        expect(board.live_at?(location_0_4)).to be(false)
        expect(board.live_at?(location_1_0)).to be(false)
        expect(board.live_at?(location_1_1)).to be(false)
        expect(board.live_at?(location_1_2)).to be(false)
        expect(board.live_at?(location_1_3)).to be(true)
        expect(board.live_at?(location_1_4)).to be(false)
        expect(board.live_at?(location_2_0)).to be(false)
        expect(board.live_at?(location_2_1)).to be(true)
        expect(board.live_at?(location_2_2)).to be(true)
        expect(board.live_at?(location_2_3)).to be(true)
        expect(board.live_at?(location_2_4)).to be(false)
        expect(board.live_at?(location_3_0)).to be(false)
        expect(board.live_at?(location_3_1)).to be(false)
        expect(board.live_at?(location_3_2)).to be(false)
        expect(board.live_at?(location_3_3)).to be(false)
        expect(board.live_at?(location_3_4)).to be(false)
        expect(board.live_at?(location_4_0)).to be(false)
        expect(board.live_at?(location_4_1)).to be(false)
        expect(board.live_at?(location_4_2)).to be(false)
        expect(board.live_at?(location_4_3)).to be(false)
        expect(board.live_at?(location_4_4)).to be(false)
      end
    end
  end

end