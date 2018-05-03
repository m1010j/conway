require 'alive_cell'

describe AliveCell do

  subject(:cell) { AliveCell.instance }

  describe '#is_alive?' do
    it 'returns true' do
      expect(cell.is_alive?).to eq(true)
    end
  end

  describe '#is_dead?' do
    it 'returns false' do
      expect(cell.is_dead?).to eq(false)
    end
  end
      
  describe '#to_s' do
    it 'returns alive string' do
      expect(cell.to_s).to eq('😁')
    end
  end

  describe '#inspect' do
    it 'returns alive string' do
      expect(cell.inspect).to eq('😁')
    end
  end

end