require 'location'

describe Location do
  let(:dimensions) { [10, 8] }

  subject(:location) do
    Location.new(coordinate: [5, 4], dimensions: dimensions)
  end

  describe '#coordinate' do
    it 'should return coordinate array' do
      expect(location.coordinate).to eq([5, 4])
    end
  end

  describe '#neighbor_locations' do
    it 'should return location objects' do
      neighbor_locations = location.neighbor_locations
      expect(neighbor_locations).to all(be_a(Location))
    end

    context 'when neighbors are in range' do
      it 'should return locations with the correct coordinate' do
        neighbor_locations = location.neighbor_locations

        neighbor_coordinates = neighbor_locations.map do |neighbor_location|
          extract_coordinates(neighbor_location)
        end

        expect(neighbor_coordinates).to match_array(
          [
            [5, 3],
            [6, 3],
            [6, 4],
            [6, 5],
            [5, 5],
            [4, 5],
            [4, 4],
            [4, 3]
          ]
        )
      end
    end

    context 'when neighbors are out of range' do
      let(:top_left_location) do
        Location.new(coordinate: [0, 0], dimensions: dimensions)
      end
      let(:top_right_location) do
        Location.new(coordinate: [9, 0], dimensions: dimensions)
      end

      it 'should wrap around' do
        top_left_neighbor_locations = top_left_location.neighbor_locations
        top_left_neighbor_coordinates = 
          top_left_neighbor_locations.map do |neighbor_location|
            extract_coordinates(neighbor_location)
          end

        top_right_neighbor_locations = top_right_location.neighbor_locations
        top_right_neighbor_coordinates = 
          top_right_neighbor_locations.map do |neighbor_location|
            extract_coordinates(neighbor_location)
          end

        expect(top_left_neighbor_coordinates).to match_array(
          [
            [0, 7],
            [1, 7],
            [1, 0],
            [1, 1],
            [0, 1],
            [9, 1],
            [9, 0],
            [9, 7]
          ]
        )
        expect(top_right_neighbor_coordinates).to match_array(
          [
            [9, 7],
            [0, 7],
            [0, 0],
            [0, 1],
            [9, 1],
            [8, 1],
            [8, 0], 
            [8, 7]
          ]
        )
      end
    end
  end
end
