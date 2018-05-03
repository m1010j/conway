require_relative 'location'
require_relative 'alive_cell'
require_relative 'dead_cell'
require_relative 'errors/invalid_initial_state'
require_relative 'modules/inspect'

class World

  include Inspect

  attr_reader :cells, :width, :height

  def initialize(attributes)
    initial_state = attributes[:initial_state]
    validate_initial_state!(initial_state)

    @cells = generate_cells(attributes)
    @width = initial_state.length
    @height = initial_state[0].length
  end

  def cell_at(location)
    cells[location.to_s]
  end

  def to_s
    result_string = ""
    height.times do |y|
      width.times do |x|
        location = Location.new(x: x, y: y, world: self)
        cell = self.cell_at(location.to_s)
        cell_string = cell.to_s
        result_string += cell_string
      end
      result_string += "\n"
    end
    result_string
  end

  private

  def validate_initial_state!(initial_state)
    unless initial_state_is_valid?(initial_state)
      raise InvalidinInitialStateError
    end
  end

  def generate_cells(attributes)
    initial_state = attributes[:initial_state]
    boring_mode = attributes[:boring_mode]
    cells = {}
    initial_state.each_with_index do |row, y|
      row.each_with_index do |state, x|
        location = Location.new(x: x, y: y, world: self)
        cell_attributes = { location: location, boring_mode: boring_mode }
        cell = state == "alive" ? 
        AliveCell.new(cell_attributes)
        :
        DeadCell.new(cell_attributes)
        cells[location.to_s] = cell
      end
    end
    cells
  end

  def initial_state_is_valid?(initial_state)
    return false unless initial_state

    flattened = initial_state.flatten
    only_dead_or_alive?(flattened) && is_rectangle?(initial_state)
  end
  
  def only_dead_or_alive?(initial_state)
    initial_state.all? do |cell_state| 
      cell_state == "alive" || cell_state == "dead"
    end
  end

  def is_rectangle?(initial_state)
    width = initial_state[0].length
    initial_state.all? { |row| row.length == width }
  end


end