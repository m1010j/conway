require 'dead_cell'
require 'ylive_cell'
require 'plive_cell'

describe DeadCell do
  subject(:cell) { DeadCell.instance }

  describe '#live?' do
    it 'returns true' do
      expect(cell.live?).to eq(false)
    end
  end

  describe '#yellow?' do
    it 'returns false' do
      expect(cell.yellow?).to eq(false)
    end
  end

  describe '#purple?' do
    it 'returns false' do
      expect(cell.purple?).to eq(false)
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

  describe '#cell_after_tick' do
    context 'when 3 live live neighbors, a majority of which are yellow' do
      it 'returns yellow cell' do
        neighbors = [
          YliveCell.instance,
          YliveCell.instance,
          YliveCell.instance,
          DeadCell.instance,
          DeadCell.instance,
          DeadCell.instance,
          DeadCell.instance,
          DeadCell.instance
        ]
        expect(cell.cell_after_tick(neighbors)).to eq(YliveCell.instance)
        
        neighbors[2] = PliveCell.instance
        expect(cell.cell_after_tick(neighbors)).to eq(YliveCell.instance)
      end
    end

    context 'when 3 live live neighbors, a majority of which are purple' do
      it 'returns purple cell' do
        neighbors = [
          PliveCell.instance,
          PliveCell.instance,
          PliveCell.instance,
          DeadCell.instance,
          DeadCell.instance,
          DeadCell.instance,
          DeadCell.instance,
          DeadCell.instance
        ]
        expect(cell.cell_after_tick(neighbors)).to eq(PliveCell.instance)
        
        neighbors[2] = YliveCell.instance
        expect(cell.cell_after_tick(neighbors)).to eq(PliveCell.instance)
      end
    end

    it 'returns self cell for ≠ 3 live neighbors' do
      neighbors = [
        DeadCell.instance,
        DeadCell.instance,
        DeadCell.instance,
        DeadCell.instance,
        DeadCell.instance,
        DeadCell.instance,
        DeadCell.instance,
        DeadCell.instance
      ]
      expect(cell.cell_after_tick(neighbors)).to eq(cell)

      neighbors[0] = YliveCell.instance
      expect(cell.cell_after_tick(neighbors)).to eq(cell)

      neighbors[1] = PliveCell.instance
      expect(cell.cell_after_tick(neighbors)).to eq(cell)

      neighbors[2] = YliveCell.instance
      neighbors[3] = PliveCell.instance
      expect(cell.cell_after_tick(neighbors)).to eq(cell)

      neighbors[4] = YliveCell.instance
      expect(cell.cell_after_tick(neighbors)).to eq(cell)

      neighbors[5] = PliveCell.instance
      expect(cell.cell_after_tick(neighbors)).to eq(cell)

      neighbors[6] = YliveCell.instance
      expect(cell.cell_after_tick(neighbors)).to eq(cell)

      neighbors[7] = PliveCell.instance
      expect(cell.cell_after_tick(neighbors)).to eq(cell)
    end
  end
end
