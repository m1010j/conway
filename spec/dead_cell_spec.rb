require 'dead_cell'

describe DeadCell do

  subject(:cell) { DeadCell.instance }

  describe '#is_alive?' do
    it 'returns true' do
      expect(cell.is_alive?).to eq(false)
    end
  end

  describe '#is_dead?' do
    it 'returns false' do
      expect(cell.is_dead?).to eq(true)
    end
  end
    
  describe '#to_s' do
    it 'returns dead string' do
      expect(cell.to_s).to eq('☠️')
    end
  end

  describe '#inspect' do
    it 'returns dead string' do
      expect(cell.inspect).to eq('☠️')
    end
  end

end