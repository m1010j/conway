require 'board'

describe Board do
  subject(:board) { Board.new(initial_state: initial_state) }

  describe '#initialize' do
    it "throws error if initial state isn't equilateral" do
      invalid_initial_state = initial_state.dup
      invalid_initial_state[0].pop
      expect { Board.new(initial_state: invalid_initial_state) }.to raise_error(InvalidInitialStateError)
    end
    it 'throws error if initial state contains invalid states' do
      invalid_initial_state = initial_state.dup
      invalid_initial_state[0][4] = :schroedinger
      expect { Board.new(initial_state: invalid_initial_state) }.to raise_error(InvalidInitialStateError)
    end
  end

  describe '#coordinates' do
    it "returns an array of board's coordinates" do
      expect(board.coordinates).to match_array(coordinates)
    end
  end

  describe '#live_at?' do
    it 'returns cell type specified by initial state' do
      true_coordinates = [[0, 2], [1, 0], [1, 2], [2, 1], [2, 2]]
      check_live_at(board, true_coordinates)
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
      expect(board.live_at?(send(:location_0_0))).to be(true)
      board.set_at(location_0_2, true)
      expect(board.live_at?(send(:location_0_2))).to be(true)
    end

    it 'can set dead cell' do
      board.set_at(location_0_0, false)
      expect(board.live_at?(send(:location_0_0))).to be(false)
      board.set_at(location_0_2, false)
      expect(board.live_at?(send(:location_0_2))).to be(false)
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
      expect(board).not_to equal(duped)
    end
    it 'returns a deep duped board' do
      duped = board.deep_dup
      non_frozen_instance_vars = board.instance_variables.reject do |var|
        attribute = board.instance_variable_get(var)
        attribute.frozen?
      end
      non_frozen_instance_vars.each do |var|
        expect(board.instance_variable_get(var)).not_to equal(
          duped.instance_variable_get(var)
        )
      end
    end
  end
end
