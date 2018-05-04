require 'singleton'
require_relative 'modules/cell'

class DeadCell

  include Singleton
  include Cell

  def is_alive?
    false
  end

  def to_s
    # '💀 '
    "\u{1f480} "
  end

  def alive_after_tick?(num_alive_neighbors)
    num_alive_neighbors === 3
  end

end