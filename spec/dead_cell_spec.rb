require 'dead_cell'

describe DeadCell do
  subject(:cell) { DeadCell.instance }

  describe '#live?' do
    it 'returns true' do
      expect(cell.live?).to eq(false)
    end
  end
    
  describe '#to_s' do
    it 'returns skull emoji string' do
      expect(cell.to_s).to eq("\u{1f480} ")
    end
  end

  describe '#inspect' do
    it 'returns skull emoji string' do
      expect(cell.inspect).to eq("\u{1f480} ")
    end
  end

  describe '#live_after_tick?' do
    it 'returns true for 3 live neighbors' do
      expect(cell.live_after_tick?(3)).to eq(true)
    end

    it 'returns false for < 3 or > 3 live neighbors' do
      (0..2).each do |num|
        expect(cell.live_after_tick?(num)).to eq(false)
      end
      (4..8).each do |num|
        expect(cell.live_after_tick?(num)).to eq(false)
      end
    end
  end
end