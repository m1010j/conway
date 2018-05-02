require 'alive_cell'

describe AliveCell do

  let(:location) { double('Location') }
  subject(:cell) { AliveCell.new(location: location) }

  describe '#location' do
    it 'returns location' do
      expect(cell.location).to eq(location)
    end
  end

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

  context 'when boring' do
    describe '#to_s' do
      it 'returns boring string' do
        expect(cell.to_s).to eq('o')
      end
    end

    describe '#inspect' do
      it 'returns boring string' do
        expect(cell.inspect).to eq('o')
      end
    end
  end
  
  context 'when exciting' do
    let(:exciting_cell) { AliveCell.new(
      boring_mode: false, 
      location: location
    ) }
    
    describe '#to_s' do
      it 'returns exciting string' do
        expect(exciting_cell.to_s).to eq('🤩')
      end
    end

    describe '#inspect' do
      it 'returns exciting string' do
        expect(exciting_cell.inspect).to eq('🤩')
      end
    end
  end

end