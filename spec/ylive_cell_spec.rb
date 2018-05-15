require 'ylive_cell'
require 'plive_cell'
require 'dead_cell'

describe YliveCell do
  subject(:cell) { YliveCell.instance }

  shared_live_cell_specs

  describe '#live?' do
    it 'returns true' do
      expect(cell.live?).to eq(true)
    end
  end

  describe '#yellow?' do
    it 'returns true' do
      expect(cell.yellow?).to eq(true)
    end
  end

  describe '#purple?' do
    it 'returns false' do
      expect(cell.purple?).to eq(false)
    end
  end

  describe '#to_s' do
    it 'returns grin emoji string' do
      expect(cell.to_s).to eq("😁 ")
    end
  end

  describe '#inspect' do
    it 'returns grin emoji string' do
      expect(cell.inspect).to eq("😁 ")
    end
  end
end
