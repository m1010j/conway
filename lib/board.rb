require_relative 'modules/validate'
require_relative 'live_cell'
require_relative 'dead_cell'

class Board
  def initialize(attributes)
    initial_state = attributes[:initial_state]
    self.class.validate_initial_state!(initial_state)

    @board = self.class.generate_board(initial_state)
  end

  def coordinates
    board.keys
  end

  def live_at?(location)
    cell = cell_at(location)
    cell.live?
  end

  def live_after_tick?(location, num_live_neighbors)
    cell = cell_at(location)
    cell.live_after_tick?(num_live_neighbors)
  end

  def set_at(location, live)
    if live
      board[location.coordinate] = LiveCell.instance
    else
      board[location.coordinate] = DeadCell.instance
    end
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

  protected
  attr_accessor :board  

  private
  extend Validate    

  def self.generate_board(initial_state)
    board = {}
    initial_state.each_with_index do |row, y|
      row.each_with_index do |state, x|
        cell = state == :live ? LiveCell.instance : DeadCell.instance
        board[[x, y]] = cell
      end
    end
    board
  end

  def cell_at(location)
    board[location.coordinate]
  end
end