require 'live_cell'

describe LiveCell do

  subject(:cell) { LiveCell.instance }

  describe '#live?' do
    it 'returns true' do
      expect(cell.live?).to eq(true)
    end
  end

  describe '#dead?' do
    it 'returns false' do
      expect(cell.dead?).to eq(false)
    end
  end
      
  describe '#to_s' do
    it 'returns live grin emoji string' do
      expect(cell.to_s).to eq("\u{1f601} ")
    end
  end

  describe '#inspect' do
    it 'returns live grin emoji string' do
      expect(cell.inspect).to eq("\u{1f601} ")
    end
  end

  describe '#live_after_tick?' do
    it 'returns true for 2 or 3 live neighbors' do
      (2..3).each do |num|
        expect(cell.live_after_tick?(num)).to eq(true)
      end
    end

    it 'returns false for < 2 or > 3 live neighbors' do
      (0..1).each do |num|
        expect(cell.live_after_tick?(num)).to eq(false)
      end
      (4..8).each do |num|
        expect(cell.live_after_tick?(num)).to eq(false)
      end
    end
  end

end