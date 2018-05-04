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
      expect(cell.to_s).to eq('💀')
    end
  end

  describe '#inspect' do
    it 'returns dead string' do
      expect(cell.inspect).to eq('💀')
    end
  end

  describe '#alive_after_tick?' do
    it 'returns true for 3 alive neighbors' do
      expect(cell.alive_after_tick?(3)).to eq(true)
    end

    it 'returns false for < 3 or > 3 alive neighbors' do
      (0..2).each do |num|
        expect(cell.alive_after_tick?(num)).to eq(false)
      end
      (4..8).each do |num|
        expect(cell.alive_after_tick?(num)).to eq(false)
      end
    end
  end

end