require 'board'

describe Board do

  let(:initial_state) {
    [
      [:dead, :live, :dead, :dead, :dead],
      [:dead, :dead, :live, :dead, :dead],
      [:live, :live, :live, :dead, :dead],
      [:dead, :dead, :dead, :dead, :dead],
      [:dead, :dead, :dead, :dead, :dead],
    ]
  }
  subject(:board) { Board.new(initial_state: initial_state) }
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

  describe '#initialize' do
    it "throws error if initial state isn't equilateral" do
      invalid_initial_state = [
        [:dead, :live, :dead, :dead],
        [:dead, :dead, :live, :dead, :dead],
        [:live, :live, :live, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead],
      ]
      expect { Board.new(initial_state: invalid_initial_state) }.
        to raise_error(InvalidInitialStateError)
    end
    it "throws error if initial state contains invalid states" do
      invalid_initial_state = [
        [:dead, :live, :dead, :dead, :schroedinger],
        [:dead, :dead, :live, :dead, :dead],
        [:live, :live, :live, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead],
      ]
      expect { Board.new(initial_state: invalid_initial_state) }.
        to raise_error(InvalidInitialStateError)
    end
  end

  describe '#coordinates' do
    it "returns an array of board's coordinates" do
      coordinates = [[0, 0],
      [0, 1],
      [0, 2],
      [0, 3],
      [0, 4],
      [1, 0],
      [1, 1],
      [1, 2],
      [1, 3],
      [1, 4],
      [2, 0],
      [2, 1],
      [2, 2],
      [2, 3],
      [2, 4],
      [3, 0],
      [3, 1],
      [3, 2],
      [3, 3],
      [3, 4],
      [4, 0],
      [4, 1],
      [4, 2],
      [4, 3],
      [4, 4]]
      expect(board.coordinates).to match_array(coordinates)
    end
  end

  describe '#live_at?' do
    it 'returns cell type specified by initial state' do
      expect(board.live_at?(location_0_0)).to be(false)
      expect(board.live_at?(location_0_1)).to be(false)
      expect(board.live_at?(location_0_2)).to be(true)
      expect(board.live_at?(location_0_3)).to be(false)
      expect(board.live_at?(location_0_4)).to be(false)
      expect(board.live_at?(location_1_0)).to be(true)
      expect(board.live_at?(location_1_1)).to be(false)
      expect(board.live_at?(location_1_2)).to be(true)
      expect(board.live_at?(location_1_3)).to be(false)
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

  describe '#live_after_tick?' do
    context 'when cell is live' do
      it 'returns true for 2 or 3 live neighbors' do
        (2..3).each do |num|
          expect(board.live_after_tick?(location_0_2, num)).to be(true)
        end
      end

      it 'returns false for < 2 or > 3 live neighbors' do
        (0..1).each do |num|
          expect(board.live_after_tick?(location_0_2, num)).to eq(false)
        end
        (4..8).each do |num|
          expect(board.live_after_tick?(location_0_2, num)).to eq(false)
        end
      end
    end

    context 'when cell is dead' do
      it 'returns true for 3 live neighbors' do
        expect(board.live_after_tick?(location_0_0, 3)).to be(true)
      end
  
      it 'returns false for < 3 or > 3 live neighbors' do
        (0..2).each do |num|
          expect(board.live_after_tick?(location_0_0, num)).to eq(false)
        end
        (4..8).each do |num|
          expect(board.live_after_tick?(location_0_0, num)).to eq(false)
        end
      end
    end
  end

  describe '#set_at' do
    it 'can set live cell' do
      board.set_at(location_0_0, true)
      expect(board.live_at?(location_0_0)).to be(true)
      board.set_at(location_0_2, true)
      expect(board.live_at?(location_0_2)).to be(true)
    end

    it 'can set dead cell' do
      board.set_at(location_0_0, false)
      expect(board.live_at?(location_0_0)).to be(false)
      board.set_at(location_0_2, false)
      expect(board.live_at?(location_0_2)).to be(false)
    end
  end

  describe '#to_s' do
    it 'returns cell string at location' do
      expect(board.to_s(location_0_0)).to eq("\u{1f480} ")
      expect(board.to_s(location_0_2)).to eq("\u{1f601} ")
    end
  end

  describe '#deep_dup' do
    it 'returns a new board' do
      duped = board.deep_dup
      expect(duped).to be_a(Board)
      expect(board.object_id).not_to be(duped.object_id)
    end
    it 'returns a deep duped board' do
      duped = board.deep_dup
      frozen_instance_vars = board.instance_variables.reject do |var|
        attribute = board.instance_variable_get(var)
        attribute.frozen?
      end
      frozen_instance_vars.each do |var|
        expect(board.instance_variable_get(var).object_id).
        not_to be(duped.instance_variable_get(var).object_id)
      end
    end
  end

end