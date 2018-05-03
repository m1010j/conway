require 'location'

describe Location do
  let(:world) { double("World") }

  subject(:location) { Location.new(
    x: 5, 
    y: 4, 
    world: world
  ) }
  

  describe '#x' do
    it 'should return x coordinate' do
      expect(location.x).to eq(5)
    end
  end

  describe '#y' do
    it 'should return y coordinate' do
      expect(location.y).to eq(4)
    end
  end

  describe '#neighbor_locations' do
    before(:each) do
      allow(world).to receive(:width).and_return(10)
      allow(world).to receive(:height).and_return(8)
    end
    
    it 'should return location objects' do
      neighbor_locations = location.neighbor_locations
      expect(neighbor_locations).to all( be_a(Location) )
    end
    
    context 'when neighbors are in range' do

      it 'should return locations with the right coordinates' do
        neighbor_locations = location.neighbor_locations

        neighbor_coordinates = neighbor_locations.map do |neighbor_location|
          {x: neighbor_location.x, y: neighbor_location.y}
        end

        expect(neighbor_coordinates).to match_array([
          {x: 5, y: 3},
          {x: 6, y: 3},
          {x: 6, y: 4},
          {x: 6, y: 5},
          {x: 5, y: 5},
          {x: 4, y: 5},
          {x: 4, y: 4},
          {x: 4, y: 3}
        ])
      end

    end

    context 'when neighbors are out of range' do 

      let(:top_left_location) { Location.new(
        x: 0, 
        y: 0, 
        world: world
      ) }
      let(:top_right_location) { Location.new(
        x: 9, 
        y: 0, 
        world: world
      ) }

      it 'should wrap around' do

        top_left_neighbor_locations = top_left_location.neighbor_locations
        top_left_neighbor_coordinates = top_left_neighbor_locations
          .map do |neighbor_location|
            {x: neighbor_location.x, y: neighbor_location.y}
          end

        top_right_neighbor_locations = top_right_location.neighbor_locations
        top_right_neighbor_coordinates = top_right_neighbor_locations
          .map do |neighbor_location|
            {x: neighbor_location.x, y: neighbor_location.y}
          end

        expect(top_left_neighbor_coordinates).to match_array([
          {x: 0, y: 7}, 
          {x: 1, y: 7}, 
          {x: 1, y: 0}, 
          {x: 1, y: 1}, 
          {x: 0, y: 1}, 
          {x: 9, y: 1}, 
          {x: 9, y: 0}, 
          {x: 9, y: 7}
        ])
        expect(top_right_neighbor_coordinates).to match_array([
          {x: 9, y: 7}, 
          {x: 0, y: 7}, 
          {x: 0, y: 0}, 
          {x: 0, y: 1}, 
          {x: 9, y: 1}, 
          {x: 8, y: 1}, 
          {x: 8, y: 0}, 
          {x: 8, y: 7}
        ])
      end

    end

  end

  describe 'to_s' do
    it 'returns a string of x and y coordinates separated by comma' do
      expect(location.to_s).to eq('5,4')
    end
  end

end