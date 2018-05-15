require 'plive_cell'
require 'ylive_cell'
require 'dead_cell'

describe PliveCell do
  subject(:cell) { PliveCell.instance }

  shared_live_cell_specs

  describe '#yellow?' do
    it 'returns false' do
      expect(cell.yellow?).to eq(false)
    end
  end

  describe '#purple?' do
    it 'returns true' do
      expect(cell.purple?).to eq(true)
    end
  end

  describe '#to_s' do
    it 'returns demon emonji string' do
      expect(cell.to_s).to eq("😈 ")
    end
  end

  describe '#inspect' do
    it 'returns demon emonji string' do
      expect(cell.inspect).to eq("😈 ")
    end
  end
end
