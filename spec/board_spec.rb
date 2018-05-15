require 'board'
require 'ylive_cell'
require 'plive_cell'
require 'dead_cell'

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
      invalid_initial_state[0][4] = :live
      expect { Board.new(initial_state: invalid_initial_state) }.to raise_error(InvalidInitialStateError)
    end
  end

  describe '#coordinates' do
    it "returns an array of board's coordinates" do
      expect(board.coordinates).to match_array(coordinates)
    end
  end

  describe '#cell_at' do
    it 'returns cell at location' do
      expect(board.cell_at(location_0_0)).to eq(DeadCell.instance)
      expect(board.cell_at(location_1_0)).to eq(YliveCell.instance)
      expect(board.cell_at(location_0_2)).to eq(PliveCell.instance)
    end
  end


  describe '#set_at' do
    it 'can set yellow live cell' do
      board.set_at(location: location_0_0, cell: YliveCell.instance)
      expect(board.cell_at(location_0_0)).to be(YliveCell.instance)
      board.set_at(location: location_0_2, cell: YliveCell.instance)
      expect(board.cell_at(location_0_2)).to be(YliveCell.instance)
    end

    it 'can set purple live cell' do
      board.set_at(location: location_0_0, cell: PliveCell.instance)
      expect(board.cell_at(location_0_0)).to be(PliveCell.instance)
      board.set_at(location: location_0_2, cell: PliveCell.instance)
      expect(board.cell_at(location_0_2)).to be(PliveCell.instance)
    end

    it 'can set dead cell' do
      board.set_at(location: location_0_0, cell: DeadCell.instance)
      expect(board.cell_at(location_0_0)).to be(DeadCell.instance)
      board.set_at(location: location_0_2, cell: DeadCell.instance)
      expect(board.cell_at(location_0_2)).to be(DeadCell.instance)
    end
  end

  describe '#to_s' do
    it 'returns cell string at location' do
      expect(board.to_s(location_0_0)).to eq("💀 ")
      expect(board.to_s(location_1_0)).to eq("😁 ")
      expect(board.to_s(location_0_2)).to eq("😈 ")
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
