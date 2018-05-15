require_relative 'location'

class World
  include Inspect
  attr_reader :generation

  def initialize(attributes)
    @dimensions = attributes[:dimensions]
    @board = attributes[:board]
    @neighbor_map = generate_neighbor_map
    @generation = 0
  end

  def tick!
    duped_board = board.deep_dup
    duped_board.coordinates.each do |coordinate|
      location = Location.new(coordinate: coordinate, dimensions: dimensions)
      neighbors = neighbors(duped_board, location)
      cell_after_tick = cell_after_tick(
        duped_board,
        location,
        neighbors
      )
      board.set_at(location: location, cell: cell_after_tick)
    end
    increment_generation
  end

  private

  attr_reader :dimensions, :neighbor_map
  attr_accessor :board

  def generate_neighbor_map
    neighbor_map = {}
    coordinates = board.coordinates
    coordinates.each do |coordinate|
      location = Location.new(coordinate: coordinate, dimensions: dimensions)
      neighbor_map[coordinate] = location.neighbor_locations
    end
    neighbor_map
  end

  def increment_generation
    @generation += 1
  end

  def neighbors(board, location)
    neighbor_locations = neighbor_map[location.coordinate]
    neighbor_locations.map do |neighbor_location|
      board.cell_at(neighbor_location)
    end
  end

  def cell_after_tick(board, location, neighbors)
    board.cell_after_tick(location, neighbors)
  end
end
