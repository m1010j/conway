require_relative 'location'
require_relative 'alive_cell'
require_relative 'dead_cell'
require_relative 'errors/invalid_initial_state'
require_relative 'modules/inspect'

class World

  include Inspect

  attr_reader :cells, :dimensions

  def initialize(attributes)
    initial_state = attributes[:initial_state]
    self.class.validate_initial_state!(initial_state)

    @cells = self.class.generate_cells(attributes)
    @dimensions = self.class.extract_dimensions(initial_state)
    @neighbor_map = generate_neighbor_map
  end

  def cell_at(location)
    cells[location.coordinate]
  end

  def neighbors_of(location)
    neighbor_locations = neighbor_map[location.coordinate]
    neighbor_locations.map do |neighbor_location|
      cells[neighbor_location.coordinate]
    end
  end

  def num_alive_neighbors(location)
    neighbors = self.neighbors_of(location)
    neighbors.count { |neighbor| neighbor.is_alive? }
  end

  def tick!
    new_cells = {}
    cells.each do |coordinate, cell|
      location = Location.new(coordinate: coordinate, dimensions: dimensions)
      num_alive_neighbors = self.num_alive_neighbors(location)
      alive_after_tick = cell.alive_after_tick?(num_alive_neighbors)
      new_cell = alive_after_tick ? AliveCell.instance : DeadCell.instance
      new_cells[coordinate] = new_cell
    end
    self.cells = new_cells
    self
  end

  def to_s
    result_string = ""
    self.height.times do |y|
      self.width.times do |x|
        location = Location.new(coordinate: [x, y], dimensions: dimensions)
        cell = self.cell_at(location)
        result_string += cell.to_s
      end
      result_string += "\n"
    end
    result_string.chomp
  end

  def width
    dimensions.first
  end

  def height
    dimensions.last
  end

  def dimensionality
    dimensions.length
  end

  private

  attr_reader :neighbor_map
  attr_writer :cells

  def self.validate_initial_state!(initial_state)
    unless initial_state_is_valid?(initial_state)
      raise InvalidinInitialStateError
    end
  end

  def self.generate_cells(attributes)
    initial_state = attributes[:initial_state]
    cells = {}
    initial_state.each_with_index do |row, y|
      row.each_with_index do |state, x|
        location = Location.new(
          coordinate: [x, y], 
          dimensions: self.extract_dimensions(initial_state)
        )
        cell = state == "alive" ? 
        AliveCell.instance
        :
        DeadCell.instance
        cells[location.coordinate] = cell
      end
    end
    cells
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

  def self.initial_state_is_valid?(initial_state)
    return false unless initial_state
  
    flattened = initial_state.flatten
    only_dead_or_alive?(flattened) && is_equilateral?(initial_state)
  end
  
  def self.only_dead_or_alive?(cell_state_array)
    cell_state_array.all? do |cell_state| 
      cell_state == "alive" || cell_state == "dead"
    end
  end

  def self.is_equilateral?(array)
    init_state_dimensionality = self.array_dimensionality(array)
    case init_state_dimensionality
    when 1
      true
    when 2
      width = array[0].length
      array.all? { |row| row.length == width }
    else
      array.all? { |inner_array| self.is_equilateral?(inner_array) }
    end
  end

  def self.array_dimensionality(array, dimens_memo = 0)
    return dimens_memo unless array.is_a?(Array)

    inner_dimens = self.array_dimensionality(array.first, dimens_memo + 1)
  end

  def self.extract_dimensions(array)
    height = array.length
    width = array[0].length
    [width, height]
  end

end