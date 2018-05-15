require_relative 'dead_cell'
require_relative 'ylive_cell'
require_relative 'plive_cell'
require_relative 'modules/validate'

class Board
  def initialize(attributes)
    initial_state = attributes[:initial_state]
    self.class.validate_initial_state!(initial_state)

    @board = self.class.generate_board(initial_state)
  end

  def coordinates
    board.keys
  end

  def cell_at(location)
    board[location.coordinate]
  end

  def set_at(args)
    location = args[:location]
    cell = args[:cell]
    
    board[location.coordinate] = cell
  end

  def to_s(location)
    cell = cell_at(location)
    cell.to_s
  end

  def deep_dup
    duped = dup
    duped.board = board.dup
    duped
  end

  def cell_after_tick(location, neighbors)
    cell = cell_at(location)
    cell.cell_after_tick(neighbors)
  end

  protected

  attr_accessor :board

  private_class_method

  extend Validate  

  def self.generate_board(initial_state)
    board = {}
    initial_state.each_with_index do |row, y|
      row.each_with_index do |state, x|
        cell = cell_map[state]
        board[[x, y]] = cell
      end
    end
    board
  end

  def self.cell_map
    {
      ylive: YliveCell.instance,
      plive: PliveCell.instance,
      dead: DeadCell.instance
    }
  end
end
