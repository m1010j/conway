require 'singleton'
require_relative 'modules/cell'

class AliveCell

  include Singleton
  include Cell

  def is_alive?
    true
  end

  def to_s
    # '😁 '
    "\u{1f601} "
  end

  def alive_after_tick?(num_alive_neighbors)
    [2, 3].include?(num_alive_neighbors)
  end

end