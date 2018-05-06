require_relative 'location'
require_relative 'live_cell'
require_relative 'dead_cell'
require_relative 'modules/inspect'
require_relative 'modules/validate'

class World

  include Inspect

  attr_reader :dimensions, :generation

  def initialize(attributes)
    initial_state = attributes[:initial_state]
    self.class.validate_initial_state!(initial_state)

    @cells = self.class.generate_cells(initial_state)
    @dimensions = self.class.extract_dimensions(initial_state)
    @neighbor_map = generate_neighbor_map
    @generation = 0
  end

  def cell_at(location)
    cells[location.coordinate]
  end

  def tick!
    new_cells = {}
    cells.each do |coordinate, cell|
      location = Location.new(coordinate: coordinate, dimensions: dimensions)
      num_live_neighbors = num_live_neighbors(location)
      live_after_tick = cell.live_after_tick?(num_live_neighbors)
      new_cell = live_after_tick ? LiveCell.instance : DeadCell.instance
      new_cells[coordinate] = new_cell
    end
    increment_generation
    self.cells = new_cells
  end

  private

  extend Validate  

  attr_reader :neighbor_map
  attr_accessor :cells

  def self.generate_cells(initial_state)
    cells = {}
    initial_state.each_with_index do |row, y|
      row.each_with_index do |state, x|
        location = Location.new(
          coordinate: [x, y], 
          dimensions: self.extract_dimensions(initial_state)
        )
        cell = state == :live ? 
        LiveCell.instance
        :
        DeadCell.instance
        cells[location.coordinate] = cell
      end
    end
    cells
  end

  def self.extract_dimensions(array)
    height = array.length
    width = array[0].length
    [width, height]
  end
  
  def generate_neighbor_map
    neighbor_map = {}
    coordinates = cells.keys
    coordinates.each do |coordinate|
      location = Location.new(coordinate: coordinate, dimensions: dimensions)
      neighbor_map[coordinate] = location.neighbor_locations
    end
    neighbor_map
  end

  def increment_generation
    @generation += 1
  end

  def neighbors_of(location)
    neighbor_locations = neighbor_map[location.coordinate]
    neighbor_locations.map do |neighbor_location|
      cells[neighbor_location.coordinate]
    end
  end

  def num_live_neighbors(location)
    neighbors = neighbors_of(location)
    neighbors.count { |neighbor| neighbor.live? }
  end

end