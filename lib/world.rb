require_relative 'alive_cell'
require_relative 'dead_cell'
require_relative 'errors/invalid_grid'

class World
  def initialize(attributes)
    validate_grid!(attributes[:grid])
  end


  private

  def validate_grid!(grid)
    raise InvalidGridError unless valid_grid(grid)
  end

  def valid_grid?(grid)
    return false unless grid

    flattened = grid.flatten
    width = grid[0].length
    grid.all? { |row| row.length == width } && 
      flattened.all? { |cell| cell.is_a?(AliveCell) || cell.is_a?(DeadCell) }
  end
end